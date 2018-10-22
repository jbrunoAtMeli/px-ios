//
//  PXOneTapViewController.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 15/5/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit

final class PXOneTapViewController: PXComponentContainerViewController {
    // MARK: Tracking
    override var screenName: String { return TrackingUtil.ScreenId.REVIEW_AND_CONFIRM_ONE_TAP }
    override var screenId: String { return TrackingUtil.ScreenId.REVIEW_AND_CONFIRM_ONE_TAP }

    // MARK: Definitions
    lazy var itemViews = [UIView]()
    fileprivate var viewModel: PXOneTapViewModel
    private lazy var footerView: UIView = UIView()
    private var discountTermsConditionView: PXTermsAndConditionView?

    let slider = PXCardSlider()

    // MARK: Callbacks
    var callbackPaymentData: ((PXPaymentData) -> Void)
    var callbackConfirm: ((PXPaymentData) -> Void)
    var callbackExit: (() -> Void)
    var finishButtonAnimation: (() -> Void)

    var loadingButtonComponent: PXAnimatedButton?
    var installmentInfoRow: PXOneTapInstallmentInfoView?
    var installmentsSelectorView: PXOneTapInstallmentsSelectorView?

    let timeOutPayButton: TimeInterval
    let shouldAnimatePayButton: Bool

    let cardSliderContentView = UIView()
    var cardSliderHeightConstraint: NSLayoutConstraint?

    // MARK: Lifecycle/Publics
    init(viewModel: PXOneTapViewModel, timeOutPayButton: TimeInterval = 15, shouldAnimatePayButton: Bool, callbackPaymentData : @escaping ((PXPaymentData) -> Void), callbackConfirm: @escaping ((PXPaymentData) -> Void), callbackExit: @escaping (() -> Void), finishButtonAnimation: @escaping (() -> Void)) {
        self.viewModel = viewModel
        self.callbackPaymentData = callbackPaymentData
        self.callbackConfirm = callbackConfirm
        self.callbackExit = callbackExit
        self.finishButtonAnimation = finishButtonAnimation
        self.timeOutPayButton = timeOutPayButton
        self.shouldAnimatePayButton = shouldAnimatePayButton
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupUI()
        scrollView.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        UIApplication.shared.statusBarStyle = .default
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingToParentViewController {
            viewModel.trackTapBackEvent()
        }

        if shouldAnimatePayButton {
            PXNotificationManager.UnsuscribeTo.animateButton(loadingButtonComponent)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        loadingButtonComponent?.resetButton()
    }

    override func trackInfo() {
        self.viewModel.trackInfo()
    }

    func update(viewModel: PXOneTapViewModel) {
        self.viewModel = viewModel
    }

    override func adjustInsets() {}
}

// MARK: UI Methods.
extension PXOneTapViewController {
    private func setupNavigationBar() {
        setBackground(color: ThemeManager.shared.highlightBackgroundColor())
        navBarTextColor = ThemeManager.shared.labelTintColor()
        loadMPStyles()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = ThemeManager.shared.whiteColor()
        navigationItem.leftBarButtonItem?.tintColor = ThemeManager.shared.labelTintColor()
        navigationController?.navigationBar.backgroundColor = ThemeManager.shared.highlightBackgroundColor()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }

    private func setupUI() {
        self.navigationController?.navigationBar.backgroundColor = .clear
        if contentView.getSubviews().isEmpty {
            renderViews()
            //super.prepareForAnimation(customAnimations: PXSpruce.PXDefaultAnimation.slideUpAnimation)
            //super.animateContentView(customAnimations: PXSpruce.PXDefaultAnimation.slideUpAnimation)
        }
    }

    private func renderViews() {
        contentView.prepareForRender()
        let safeAreaBottomHeight = PXLayout.getSafeAreaBottomInset()

        // Add header view.
        let headerView = getHeaderView()
        contentView.addSubviewToBottom(headerView)
        PXLayout.setHeight(owner: headerView, height: PXCardSliderSizeManager.getHeaderViewHeight(viewController: self)).isActive = true
        PXLayout.centerHorizontally(view: headerView).isActive = true
        PXLayout.matchWidth(ofView: headerView).isActive = true

        // Center white View
        let whiteView = getWhiteView()
        // TODO: Margin factor for white view is temporary. Only for test
        // Make solution like expandBody
        contentView.addSubviewToBottom(whiteView)
        PXLayout.setHeight(owner: whiteView, height: PXCardSliderSizeManager.getWhiteViewHeight(viewController: self)).isActive = true
        PXLayout.centerHorizontally(view: whiteView).isActive = true
        PXLayout.pinLeft(view: whiteView, withMargin: 0).isActive = true
        PXLayout.pinRight(view: whiteView, withMargin: 0).isActive = true

        // Add installment row
        let installmentRow = getInstallmentInfoView()
        whiteView.addSubview(installmentRow)
        PXLayout.centerHorizontally(view: installmentRow).isActive = true
        PXLayout.pinLeft(view: installmentRow).isActive = true
        PXLayout.pinRight(view: installmentRow).isActive = true
        PXLayout.matchWidth(ofView: installmentRow).isActive = true
        PXLayout.pinTop(view: installmentRow, withMargin: PXLayout.XXXS_MARGIN).isActive = true

        // Add card slider
        whiteView.addSubview(cardSliderContentView)
        cardSliderContentView.clipsToBounds = true
        PXLayout.centerHorizontally(view: cardSliderContentView).isActive = true
        PXLayout.pinLeft(view: cardSliderContentView).isActive = true
        PXLayout.pinRight(view: cardSliderContentView).isActive = true
        let heightConstraint = PXLayout.put(view: cardSliderContentView, onBottomOf: installmentRow, withMargin: 0)
        heightConstraint.isActive = true
        cardSliderHeightConstraint = heightConstraint
//        PXLayout.put(view: cardSliderContentView, onBottomOf: installmentRow).isActive = true
        PXLayout.setHeight(owner: cardSliderContentView, height: PXCardSliderSizeManager.getSliderSize().height).isActive = true

        // Add footer payment button.
        if let footerView = getFooterView() {
            //contentView.addSubviewToBottom(footerView, withMargin: PXLayout.M_MARGIN)
            whiteView.addSubview(footerView)
            PXLayout.centerHorizontally(view: footerView).isActive = true
            PXLayout.pinLeft(view: footerView, withMargin: PXLayout.M_MARGIN).isActive = true
            PXLayout.pinRight(view: footerView, withMargin: PXLayout.M_MARGIN).isActive = true
            PXLayout.setHeight(owner: footerView, height: PXLayout.XXL_MARGIN).isActive = true

            if safeAreaBottomHeight > 0 {
                PXLayout.pinBottom(view: footerView, withMargin: PXLayout.XXS_MARGIN + safeAreaBottomHeight).isActive = true
            } else {
                PXLayout.pinBottom(view: footerView, withMargin: PXLayout.M_MARGIN).isActive = true
            }
        }

        view.layoutIfNeeded()
        refreshContentViewSize()
        scrollView.isScrollEnabled = false
        scrollView.showsVerticalScrollIndicator = false

        addCardSlider(inContainerView: cardSliderContentView)
    }
}

// MARK: Components Builders.
extension PXOneTapViewController {
    private func getHeaderView() -> UIView {
        let viewModel = self.viewModel.getHeaderViewModel()
        let headerView = PXOneTapHeaderView(viewModel: viewModel)
        return headerView
    }

    private func getFooterView() -> UIView? {
        loadingButtonComponent = PXAnimatedButton(normalText: "Pagar".localized, loadingText: "Procesando tu pago".localized, retryText: "Reintentar".localized)
        loadingButtonComponent?.animationDelegate = self
        loadingButtonComponent?.layer.cornerRadius = 8
        loadingButtonComponent?.add(for: .touchUpInside, {
            if self.shouldAnimatePayButton {
                self.subscribeLoadingButtonToNotifications()
                self.loadingButtonComponent?.startLoading(timeOut: self.timeOutPayButton)
            }
            self.confirmPayment()
        })
        loadingButtonComponent?.setTitle("Pagar".localized, for: .normal)
        loadingButtonComponent?.backgroundColor = ThemeManager.shared.getAccentColor()
        return loadingButtonComponent
    }

    private func getWhiteView() -> UIView {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        return whiteView
    }

    private func getInstallmentInfoView() -> UIView {
        installmentInfoRow = PXOneTapInstallmentInfoView()
        installmentInfoRow?.model = PXOneTapInstallmentInfoViewModel(leftText: "", rightText: "", installmentData: nil)
        installmentInfoRow?.render()
        installmentInfoRow?.delegate = self
        if let targetView = installmentInfoRow {
            return targetView
        } else {
            return UIView()
        }
    }

    private func addCardSlider(inContainerView: UIView) {
        slider.render(containerView: inContainerView, cardSliderProtocol: self)
        slider.update(OneTapService.getCardSliderViewModel())
    }

    private func getDiscountDetailView() -> UIView? {
        if self.viewModel.amountHelper.discount != nil || self.viewModel.amountHelper.consumedDiscount {
            let discountDetailVC = PXDiscountDetailViewController(amountHelper: self.viewModel.amountHelper, shouldShowTitle: true)
            return discountDetailVC.getContentView()
        }
        return nil
    }
}

// MARK: User Actions.
extension PXOneTapViewController: PXTermsAndConditionViewDelegate {
    @objc func shouldOpenSummary() {
        viewModel.trackTapSummaryDetailEvent()
        if viewModel.shouldShowSummaryModal() {
            if let summaryProps = viewModel.getSummaryProps(), summaryProps.count > 0 {
                let summaryViewController = PXOneTapSummaryModalViewController()
                summaryViewController.setProps(summaryProps: summaryProps, bottomCustomView: getDiscountDetailView())
                PXComponentFactory.Modal.show(viewController: summaryViewController, title: "Detalle".localized)
            } else {
                if let discountView = getDiscountDetailView() {
                    let summaryViewController = PXOneTapSummaryModalViewController()
                    summaryViewController.setProps(summaryProps: nil, bottomCustomView: discountView)
                    PXComponentFactory.Modal.show(viewController: summaryViewController, title: nil)
                }
            }
        }
    }

    @objc func shouldChangePaymentMethod() {
        viewModel.trackChangePaymentMethodEvent()
        callbackPaymentData(viewModel.getClearPaymentData())
    }

    private func confirmPayment() {
        scrollView.isScrollEnabled = false
        view.isUserInteractionEnabled = false
        self.viewModel.trackConfirmActionEvent()
        self.hideBackButton()
        self.hideNavBar()
        self.callbackConfirm(self.viewModel.amountHelper.paymentData)
    }

    func resetButton() {
        loadingButtonComponent?.resetButton()
        loadingButtonComponent?.showErrorToast()
// MARK: Uncomment for Shake button
//        loadingButtonComponent?.shake()
    }

    private func cancelPayment() {
        self.callbackExit()
    }

    func shouldOpenTermsCondition(_ title: String, screenName: String, url: URL) {
        let webVC = WebViewController(url: url, screenName: screenName, navigationBarTitle: title)
        webVC.title = title
        self.navigationController?.pushViewController(webVC, animated: true)
    }
}

// MARK: CardSlider delegate.
extension PXOneTapViewController: PXCardSliderProtocol {
    func newCardDidSelected(targetModel: PXCardSliderViewModel) {
        // Add payment method card. CardData nil
        if targetModel.cardData == nil {
            loadingButtonComponent?.setDisabled()
        } else {
            print("newCardDidSelected: \(String(describing: targetModel.cardData?.number))")
            loadingButtonComponent?.setEnabled()
        }
        installmentInfoRow?.updateViewModel(OneTapService.getInstallmentViewModel(cardSliderViewModel: targetModel))
    }

    func addPaymentMethodCardDidTap() {
        // TODO: Go to grupos -> add new card
        shouldChangePaymentMethod()
    }
}

// MARK: Installment Row Info delegate.
extension PXOneTapViewController: PXOneTapInstallmentInfoViewProtocol, PXOneTapInstallmentsSelectorProtocol {

    func payerCostSelected(_ payerCost: PXPayerCost?) {
        self.installmentInfoRow?.toggleInstallments()
        //TODO: Update payment data
    }

    func hideInstallments() {
        self.installmentsSelectorView?.layoutIfNeeded()
        self.installmentInfoRow?.disableTap()

        self.installmentsSelectorView?.collapse(sliderView: self.contentView, sliderHeightConstraint: cardSliderHeightConstraint) {
            self.installmentInfoRow?.enableTap()
            self.installmentsSelectorView?.removeFromSuperview()
            self.installmentsSelectorView?.layoutIfNeeded()
        }

//        self.installmentsSelectorView?.collapse {
//            self.installmentInfoRow?.enableTap()
//            self.installmentsSelectorView?.removeFromSuperview()
//            self.installmentsSelectorView?.layoutIfNeeded()
//        }
    }

    func showInstallments(installmentData: PXInstallment?) {

        guard let installmentData = installmentData, let installmentInfoRow = installmentInfoRow else {
            return
        }

        self.installmentsSelectorView?.removeFromSuperview()
        self.installmentsSelectorView?.layoutIfNeeded()
        let viewModel = PXOneTapInstallmentsSelectorViewModel(installmentData: installmentData)
        let installmentsSelectorView = PXOneTapInstallmentsSelectorView(viewModel: viewModel)
        installmentsSelectorView.delegate = self
        self.installmentsSelectorView = installmentsSelectorView

        contentView.addSubview(installmentsSelectorView)
        PXLayout.matchWidth(ofView: installmentsSelectorView).isActive = true
        PXLayout.centerHorizontally(view: installmentsSelectorView).isActive = true
        PXLayout.put(view: installmentsSelectorView, onBottomOf: installmentInfoRow).isActive = true
        PXLayout.setHeight(owner: installmentsSelectorView, height: PXCardSliderSizeManager.getWhiteViewHeight(viewController: self)-PXOneTapInstallmentInfoView.DEFAULT_ROW_HEIGHT).isActive = true

        installmentsSelectorView.layoutIfNeeded()
        self.installmentInfoRow?.disableTap()


        installmentsSelectorView.expand(sliderView: self.contentView, sliderHeightConstraint: cardSliderHeightConstraint) {
            self.installmentInfoRow?.enableTap()
        }
//        installmentsSelectorView.expand {
//            self.installmentInfoRow?.enableTap()
//        }
    }
}

// MARK: Payment Button animation delegate
@available(iOS 9.0, *)
extension PXOneTapViewController: PXAnimatedButtonDelegate {
    func shakeDidFinish() {
        displayBackButton()
        scrollView.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        unsubscribeFromNotifications()
        UIView.animate(withDuration: 0.3, animations: {
            self.loadingButtonComponent?.backgroundColor = ThemeManager.shared.getAccentColor()
        })
    }

    func expandAnimationInProgress() {
    }

    func didFinishAnimation() {
        self.finishButtonAnimation()
    }

    func progressButtonAnimationTimeOut() {
        loadingButtonComponent?.resetButton()
        loadingButtonComponent?.showErrorToast()
// MARK: Uncomment for Shake button
//        loadingButtonComponent?.shake()
    }
}

// MARK: Notifications
extension PXOneTapViewController {
    func subscribeLoadingButtonToNotifications() {
        guard let loadingButton = loadingButtonComponent else {
            return
        }

        PXNotificationManager.SuscribeTo.animateButton(loadingButton, selector: #selector(loadingButton.animateFinish))
    }

    func unsubscribeFromNotifications() {
        PXNotificationManager.UnsuscribeTo.animateButton(loadingButtonComponent)
    }
}
