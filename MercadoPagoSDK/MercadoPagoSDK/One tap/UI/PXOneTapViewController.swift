//
//  PXOneTapViewController.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 15/5/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit
import MercadoPagoPXTracking

final class PXOneTapViewController: PXComponentContainerViewController {
    // MARK: Tracking
    override var screenName: String { return TrackingUtil.SCREEN_NAME_REVIEW_AND_CONFIRM_ONE_TAP }
    override var screenId: String { return TrackingUtil.SCREEN_ID_REVIEW_AND_CONFIRM_ONE_TAP }

    // MARK: Definitions
    lazy var itemViews = [UIView]()
    fileprivate var viewModel: PXOneTapViewModel
    private lazy var footerView: UIView = UIView()
    private var summaryView: PXSmallSummaryView?

    // MARK: Callbacks
    var callbackPaymentData: ((PaymentData) -> Void)
    var callbackConfirm: ((PaymentData) -> Void)
    var callbackExit: (() -> Void)

    // MARK: Lifecycle/Publics
    init(viewModel: PXOneTapViewModel, callbackPaymentData : @escaping ((PaymentData) -> Void), callbackConfirm: @escaping ((PaymentData) -> Void), callbackExit: @escaping (() -> Void)) {
        self.viewModel = viewModel
        self.callbackPaymentData = callbackPaymentData
        self.callbackConfirm = callbackConfirm
        self.callbackExit = callbackExit
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    override func trackInfo() {
        self.viewModel.trackInfo()
    }

    func update(viewModel: PXOneTapViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: UI Methods.
extension PXOneTapViewController {
    fileprivate func setupUI() {
        navBarTextColor = ThemeManager.shared.labelTintColor()
        loadMPStyles()
        navigationController?.navigationBar.barTintColor = ThemeManager.shared.whiteColor()
        navigationItem.leftBarButtonItem?.tintColor = ThemeManager.shared.labelTintColor()
        if contentView.getSubviews().isEmpty {
            renderViews()
        }
    }

    fileprivate func renderViews() {
        self.contentView.prepareForRender()

        // Chevron fake action. // TODO: Remove after Eden merge.
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Tap me", for: .normal)
        contentView.addSubviewToBottom(button, withMargin: PXLayout.M_MARGIN)
        PXLayout.pinLeft(view: button, withMargin: PXLayout.M_MARGIN).isActive = true
        PXLayout.pinRight(view: button, withMargin: PXLayout.M_MARGIN).isActive = true
        PXLayout.setHeight(owner: button, height: 44).isActive = true
        let chevronAction = UITapGestureRecognizer(target: self, action: #selector(self.shouldOpenSummary))
        button.addGestureRecognizer(chevronAction)

        // Add small summary.
        if let smallSummaryView = getSmallSummaryView() {
            contentView.addSubviewToBottom(smallSummaryView)
            PXLayout.pinLeft(view: smallSummaryView, withMargin: PXLayout.M_MARGIN).isActive = true
            PXLayout.pinRight(view: smallSummaryView, withMargin: PXLayout.M_MARGIN).isActive = true
        }

        // Add payment method.
        if let paymentMethodView = getPaymentMethodComponentView() {
            contentView.addSubviewToBottom(paymentMethodView, withMargin: PXLayout.M_MARGIN)
            PXLayout.pinLeft(view: paymentMethodView, withMargin: PXLayout.M_MARGIN).isActive = true
            PXLayout.pinRight(view: paymentMethodView, withMargin: PXLayout.M_MARGIN).isActive = true
            let paymentMethodTapAction = UITapGestureRecognizer(target: self, action: #selector(self.shouldChangePaymentMethod))
            paymentMethodView.addGestureRecognizer(paymentMethodTapAction)
        }

        // Add footer payment button.
        footerView = getFooterView()
        contentView.addSubviewToBottom(footerView)
        PXLayout.matchWidth(ofView: footerView).isActive = true
        PXLayout.centerHorizontally(view: footerView).isActive = true

        self.view.layoutIfNeeded()
        super.refreshContentViewSize()
        summaryView?.hide() //TODO: Use after Eden merge.
    }
}

// MARK: Components Builders.
extension PXOneTapViewController {
    private func getSmallSummaryView() -> UIView? {
        let summaryViewProps: [PXSummaryRowProps] = [(title: "AySA", subTitle: "Factura agua", rightText: "$ 1200", backgroundColor: nil), (title: "Edenor", subTitle: "Pago de luz mensual", rightText: "$ 400", backgroundColor: nil)]
        if let smallSummaryView = PXSmallSummaryView(withProps: summaryViewProps, backgroundColor: ThemeManager.shared.lightTintColor()).oneTapRender() as? PXSmallSummaryView {
            summaryView = smallSummaryView
            return summaryView
        }
        return nil
    }

    private func getPaymentMethodComponentView() -> UIView? {
        if let paymentMethodComponent = viewModel.getPaymentMethodComponent() {
            return paymentMethodComponent.oneTapRender()
        }
        return nil
    }

    private func getFooterView() -> UIView {
        let payAction = PXComponentAction(label: "Confirmar".localized) { [weak self] in
            self?.confirmPayment()
        }
        let footerProps = PXFooterProps(buttonAction: payAction)
        let footerComponent = PXFooterComponent(props: footerProps)
        return footerComponent.oneTapRender()
    }
}

// MARK: User Actions.
extension PXOneTapViewController {

    @objc func shouldOpenSummary() {
        //summaryView?.toggle() //TODO: Use after Eden merge.
        let summaryViewProps: [PXSummaryRowProps] = [(title: "AySA", subTitle: "Factura agua", rightText: "$ 1200", backgroundColor: nil), (title: "Edenor", subTitle: "Pago de luz mensual", rightText: "$ 400", backgroundColor: nil)]
        let summaryViewController = PXOneTapSummaryModalViewController()
        summaryViewController.setProps(summaryProps: summaryViewProps)
        PXComponentFactory.Modal.show(viewController: summaryViewController, title: "Detalle")
    }

    @objc func shouldChangePaymentMethod() {
        viewModel.trackChangePaymentMethodEvent()
        callbackPaymentData(viewModel.getClearPaymentData())
    }

    fileprivate func confirmPayment() {
        self.viewModel.trackConfirmActionEvent()
        self.hideNavBar()
        self.hideBackButton()
        self.callbackConfirm(self.viewModel.paymentData)
    }

    fileprivate func cancelPayment() {
        self.callbackExit()
    }
}
