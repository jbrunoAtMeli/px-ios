//
//  AndesBottomSheetContentViewController.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import UIKit

private enum Constants {
    static let cornerRadius: CGFloat = 6.0
    static let headerGradientHeight: CGFloat = 6.0
    static let headerGradientMaxOffset: CGFloat = 10.0
}

class AndesBottomSheetContentViewController: UIViewController {
    private(set) var viewController: UIViewController
    private(set) var titleBar = AndesBottomSheetTitleBar()

    var scrollView: UIScrollView?

    private let grabView = AndesBottomSheetGrab()

    private let headerContentView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    private let headerGradientView = AndesBottomSheetTitleBarGradient(maxOffset: Constants.headerGradientMaxOffset)

    private let contentView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    private var scrollViewContentOffsetObservation: NSKeyValueObservation?

    init(viewController: UIViewController) {
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        removeObservers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        setupContentView()
        setupContent()
        setupCornerRadius()
        setupScrollView()
        setupGradient()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculatePreferredContentSize()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calculatePreferredContentSize()
    }

    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.pinToSuperview()
        headerContentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(headerContentView)
    }

    private func setupContent() {
        headerContentView.addArrangedSubview(grabView)
        headerContentView.addArrangedSubview(titleBar)

        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)

        viewController.view.layoutIfNeeded()
    }

    private func setupGradient() {
        headerGradientView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headerGradientView)
        NSLayoutConstraint.activate([
            headerGradientView.topAnchor.constraint(equalTo: headerContentView.bottomAnchor),
            headerGradientView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            headerGradientView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            headerGradientView.heightAnchor.constraint(equalToConstant: Constants.headerGradientHeight)
        ])
        if let scrollView = scrollView {
            scrollViewContentOffsetObservation = scrollView.observe(\.contentOffset,
                                                                    options: [.old, .new]) { [weak self] _, _ in
                guard let self = self else { return }
                self.updateGradientShadow()
            }
        }
    }

    private func setupScrollView() {
        // Attempt to find scrollview in view or first level subviews
        if let scrollView = viewController.view as? UIScrollView {
            self.scrollView = scrollView
        } else {
            self.scrollView = viewController.view.subviews
                .first(where: { $0 is UIScrollView }) as? UIScrollView
        }
    }

    private func calculatePreferredContentSize() {
        let currentSize = preferredContentSize
        let targetSize = CGSize(width: view.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let headerSize = headerContentView.systemLayoutSizeFitting(targetSize)
        let contentSize = calculateContentSize()
        let newSize = CGSize(width: view.bounds.width, height: headerSize.height + contentSize.height)
        if newSize != currentSize {
            preferredContentSize = newSize
        }
    }

    private func calculateContentSize() -> CGSize {
        if let internalScrollView = scrollView {
            return internalScrollView.contentSize
        }
        return viewController.view.bounds.size
    }

    private func removeObservers() {
        scrollViewContentOffsetObservation?.invalidate()
    }

    private func updateGradientShadow() {
        guard let internalScrollView = scrollView else { return }
        headerGradientView.update(with: internalScrollView.contentOffset.y)
    }

    private func setupCornerRadius() {
        view.clipsToBounds = true
        view.setCornerRadius(cornerRadius: Constants.cornerRadius, roundedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
}
