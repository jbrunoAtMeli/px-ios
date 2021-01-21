//
//  AndesTextAreaView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/26/20.
//

import Foundation

class AndesTextAreaView: AndesTextFieldAbstractView {
    @IBOutlet weak var textView: AndesUITextView!
    @IBOutlet weak var placeholderLabel: UILabel!

    override var text: String {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
            textViewDidChange(textView)
        }
    }

    override var customInputView: UIView? {
        get {
            return textView.inputView
        }
        set (value) {
            textView.inputView = value
        }
    }

    private var accessoryView: UIView?
    override var customInputAccessoryView: UIView? {
        get {
            return accessoryView
        }
        set (value) {
            accessoryView = value
            textView.inputAccessoryView = value
        }
    }

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextAreaView", owner: self, options: nil)
        textView.delegate = self
        self.textView.textContainerInset = UIEdgeInsets(top: config.paddings.top, left: config.paddings.left, bottom: config.paddings.bottom, right: config.paddings.right)
        textView.isScrollEnabled = false
        textView.clipsToBounds = false

        textView.onNeedsBorderUpdate = { [weak self] (_: UIView) in
            self?.updateBorder()
        }
    }

    override func updateView() {
        super.updateView()
        placeholderLabel.setAndesStyle(style: config.placeholderStyle)
        placeholderLabel.text = config.placeholderText
        placeholderLabel.isHidden = self.text.count > 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = config.inputTextStyle.lineSpacing
        self.textView.typingAttributes = [.font: config.inputTextStyle.font, .strokeColor: config.inputTextStyle.textColor, .paragraphStyle: paragraphStyle]
        self.textView.isUserInteractionEnabled = config.editingEnabled
        self.textView.textContainerInset = UIEdgeInsets(top: config.paddings.top, left: config.paddings.left, bottom: config.paddings.bottom, right: config.paddings.right)

        if let traits = config.textInputTraits {
            self.textView.setInputTraits(traits)
        }
    }
}

// MARK: - Utils functions for textview
extension AndesTextAreaView {
    func sizeForText(_ txt: NSString) -> CGSize {
        let width = self.textView.textContainer.size.width
        let size = CGSize(width: width, height: .infinity)
        let textRect = txt.boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: textView.typingAttributes, context: nil)
        return textRect.size
    }
}

extension AndesTextAreaView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.delegate?.didBeginEditing()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        self.delegate?.didEndEditing(text: self.text)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        // max lines check
        if let maxLines = config.maxLines, maxLines > 0, let range = Range(range, in: textView.text) {
            let newStr = textView.text.replacingCharacters(in: range, with: text)
            if sizeForText(newStr as NSString).height > sizeForText(String(repeating: "\n", count: Int(maxLines - 1)) as NSString).height {
                return false
            }
        }

        return delegate?.textField(shouldChangeCharactersIn: range, replacementString: text) != false
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return delegate?.shouldBeginEditing() != false
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return delegate?.shouldEndEditing() != false
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.didChangeSelection(selectedRange: textView.selectedTextRange)
    }

    func textViewDidChange(_ textView: UITextView) {
        self.delegate?.didChange()
        self.placeholderLabel.isHidden = self.text.count > 0
        self.checkLengthAndUpdateCounterLabel()
    }
}
