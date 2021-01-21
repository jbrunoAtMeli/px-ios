//
//  
//  AndesBottomSheetViewController.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//
//

import UIKit

private enum Constants {
    static let backgroundColor: UIColor = UIColor.Andes.gray800
    static var marginFromTop: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 100.0
            }
            return UIApplication.shared.statusBarFrame.height
        }
    }
    static let sizes: [AndesBottomSheetSize] = [.min(.intrinsic, .percent(0.60)),
                                                .min(.intrinsic, .fixedFromTop(Constants.marginFromTop))]
}

open class AndesBottomSheetViewController: UIViewController {
    @objc
    public var rootViewController: UIViewController {
        get {
            return contentController.viewController
        }
    }

    @objc
    public weak var delegate: AndesBottomSheetViewControllerDelegate?

    @objc
    public var titleBar: AndesBottomSheetTitleBar {
        get {
            contentController.titleBar
        }
    }

    private var scrollView: UIScrollView? {
        get {
            return contentController.scrollView
        }
    }

    private(set) var dimmerView: UIView = UIView()

    private var contentController: AndesBottomSheetContentViewController

    private var isPanning: Bool = false
    private var panEffects: [PanEffect] = []
    private var panGestureRecognizer: UIPanGestureRecognizer!

    private let sizeManager: AndesBottomSheetSizeManager!
    private var heightConstraintManager: AndesBottomSheetHeightManager!

    private let transitioningConformance = AndesBottomSheetViewControllerTransitioningConformance()
    private lazy var gestureRecognizerConformance = {
       return AndesBottomSheetViewControllerGestureRecognizerConformance(sizeManager: sizeManager)
    }()

    @objc
    public init(rootViewController: UIViewController) {
        self.contentController = AndesBottomSheetContentViewController(viewController: rootViewController)
        self.sizeManager = AndesBottomSheetSizeManager(sizes: Constants.sizes)
        super.init(nibName: nil, bundle: nil)
        self.transitioningDelegate = transitioningConformance
        self.modalPresentationStyle = .overCurrentContext
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupOverlayView()
        setupContentViewController()
        setupPanGestureRecognizer()
        setupTapGestureRecognizer()
        setupPanEffects()
        setupScrollView()
    }

    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !isPanning else { return }
        heightConstraintManager.setActive(false)
        sizeManager.sheetViewSize = view.bounds.size
        heightConstraintManager.setHeight(sizeManager.currentDimension)
        heightConstraintManager.setActive(true)
    }

    open override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        super.preferredContentSizeDidChange(forChildContentContainer: container)
        guard !isPanning else { return }
        heightConstraintManager.setActive(false)
        sizeManager.sheetViewSize = view.bounds.size
        sizeManager.sheetContentSize = container.preferredContentSize
        heightConstraintManager.setHeight(sizeManager.currentDimension)
        heightConstraintManager.setActive(true)
    }

    private func setupView() {
        view.backgroundColor = .clear
    }

    private func setupOverlayView() {
        dimmerView.backgroundColor = Constants.backgroundColor
        view.addSubview(dimmerView)
        dimmerView.translatesAutoresizingMaskIntoConstraints = false
        dimmerView.pinToSuperview()
    }

    private func setupContentViewController() {
        contentController.willMove(toParent: self)
        addChild(contentController)
        view.addSubview(contentController.view)
        heightConstraintManager = AndesBottomSheetHeightManager(constraint: contentController.view.heightAnchor.constraint(equalToConstant: sizeManager.currentDimension),
                                                                delegate: self)
        NSLayoutConstraint.activate([
            contentController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentController.view.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor)
        ])
        contentController.didMove(toParent: self)
    }

    private func setupPanGestureRecognizer() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        panGestureRecognizer.delegate = gestureRecognizerConformance
        view.addGestureRecognizer(panGestureRecognizer)
    }

    private func setupTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        dimmerView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupPanEffects() {
        panEffects.append(ResizePanEffect(sizeManager: sizeManager, heightManager: heightConstraintManager, contentController: contentController))
        panEffects.append(VelocityDismissPanEffect(contentController: contentController, presentingController: presentingViewController, sizeManager: sizeManager))
        panEffects.append(StretchingPanEffect(sizeManager: sizeManager, heightManager: heightConstraintManager))
        panEffects.append(PullDownPanEffect(contentController: contentController, presentingController: presentingViewController, dimmerView: dimmerView, sizeManager: sizeManager, heightManager: heightConstraintManager))
    }

    private func setupScrollView() {
        gestureRecognizerConformance.scrollView = scrollView
        scrollView?.panGestureRecognizer.require(toFail: panGestureRecognizer)
    }

    @objc
    private func panned(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began { isPanning = true }
        panEffects.forEach { $0.panned(in: view, recognizer: recognizer) }
        if [UIGestureRecognizer.State.cancelled, UIGestureRecognizer.State.failed, UIGestureRecognizer.State.ended].contains(recognizer.state) { isPanning = false }
    }

    @objc
    private func tapped(_ recongizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true)
    }
}

extension AndesBottomSheetViewController: AndesBottomSheetHeightManagerDelegate {
    func heightDidChange(_ height: CGFloat) {
        delegate?.sheetViewController(self, heightDidChange: height)
    }
}
