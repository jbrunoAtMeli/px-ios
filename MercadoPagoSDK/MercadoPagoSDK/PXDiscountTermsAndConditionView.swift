//
//  PXDiscountTermsAndConditionView.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 28/5/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

final class PXDiscountTermsAndConditionView: PXTermsAndConditionView {

    private var amountHelper: PXAmountHelper

    init(amountHelper: PXAmountHelper) {
        self.amountHelper = amountHelper
        super.init()
        self.SCREEN_NAME = "DISCOUNT_TERMS_AND_CONDITIONS"
        self.SCREEN_TITLE = "Términos y Condiciones"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func getTyCText() -> NSMutableAttributedString {
        let termsAndConditionsText = "Descuento exclusivo de Mercado Libre.\nVer condiciones".localized
        let highlightedText = "Ver condiciones".localized

        let normalAttributes: [NSAttributedStringKey: AnyObject] = [NSAttributedStringKey.font: Utils.getFont(size: 12), NSAttributedStringKey.foregroundColor: ThemeManager.shared.labelTintColor()]

        let mutableAttributedString = NSMutableAttributedString(string: termsAndConditionsText, attributes: normalAttributes)
        let tycLinkRange = (termsAndConditionsText as NSString).range(of: highlightedText)

        mutableAttributedString.addAttribute(NSAttributedStringKey.link, value: self.getTyCURL(), range: tycLinkRange)

        let style = NSMutableParagraphStyle()
        style.alignment = .center
        style.lineSpacing = CGFloat(3)

        mutableAttributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSRange(location: 0, length: mutableAttributedString.length))
        return mutableAttributedString
    }

    override func handleTap(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: self.getTyCURL()) {
            delegate?.shouldOpenTermsCondition(SCREEN_TITLE.localized, screenName: SCREEN_NAME, url: url)
        }
    }

    func getTyCURL() -> String {
        if let discountID = self.amountHelper.discount?.id {
            return "https://api.mercadolibre.com/campaigns/\(discountID)/terms_and_conditions?format_type=html"
        }
        return ""
    }
}
