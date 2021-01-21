//
//  AndesTextFieldCodeAbstractView.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

class AndesTextFieldCodeAbstractView: UIControl, AndesTextFieldCodeView {

    // MARK: Views
    @IBOutlet weak var andesCodeTextFieldView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var helperIconImageView: UIImageView!

    // MARK: Constraints
    var helpLabelLeadingIconConstraint = NSLayoutConstraint()
    var helpLabelLeadingConstraint = NSLayoutConstraint()

    var config: AndesTextFieldCodeViewConfig
    weak var delegate: AndesTextFieldCodeDelegate?

    var text: String = "" {
        didSet {
            delegate?.textDidChange?(text)
            delegate?.textDidComplete?(allTextFieldsCompleted())
        }
    }

    // Privates
    private var focusSet = false
    private var focusRemoved = false
    private var temporalText: String?

    internal init(config: AndesTextFieldCodeViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesTextFieldCodeViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window == nil { return }

        // This is necessary when setFocus() or removeFocus() are called, or variable 'text' is set, BEFORE the view is part of an active view hierarchy
        if let tempText = temporalText {
            fillTextFieldsWith(text: tempText, from: 0)
        }
        if focusSet {
            let textField = getTextFieldsArray().first(where: { $0.text.isEmpty }) ?? getTextFieldsArray().last
            textField?.becomeFirstResponder()
        }
        if focusRemoved {
            getTextFieldsArray().forEach { $0.resignFirstResponder() }
        }
        temporalText = nil
        focusSet = false
        focusRemoved = false
    }
}

// MARK: AndesTextFieldCodeView implementation
extension AndesTextFieldCodeAbstractView {
    func update(withConfig config: AndesTextFieldCodeViewConfig) {
        self.config = config
        updateView()
    }

    func setText(_ newValue: String) {
        let numericCharacters = getNumericCharactersFrom(text: newValue)
        if !text.isEmpty && (!numericCharacters.isEmpty || newValue.isEmpty) { cleanTextFields() }

        // func becomeFirstResponder() must not be called on a view that is not part of an active view hierarchy. If that is the case, text is temporarily stored. When the view is part of the window fillTextFieldsWith() is eventually called in didMoveToWindow()
        if window != nil {
            fillTextFieldsWith(text: numericCharacters, from: 0)
        } else {
            temporalText = numericCharacters
        }
    }

    func setFocus() {
        if window == nil {
            focusSet = true
            return
        }

        let textFieldsArray = getTextFieldsArray()
        let textField = textFieldsArray.first(where: { $0.text.isEmpty }) ?? textFieldsArray.last
        textField?.becomeFirstResponder()
    }

    func removeFocus() {
        if window == nil {
            focusRemoved = true
            return
        }
        getTextFieldsArray().forEach { $0.resignFirstResponder() }
    }
}

// MARK: Privates
private extension AndesTextFieldCodeAbstractView {
    func setup() {
        setupView()
        loadNib()
        pinXibViewToSelf()
        setupTextFields()
        setupConstraints()
        updateView()
    }

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .clear
    }

    func pinXibViewToSelf() {
        andesCodeTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(andesCodeTextFieldView)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: andesCodeTextFieldView.leadingAnchor),
            trailingAnchor.constraint(equalTo: andesCodeTextFieldView.trailingAnchor),
            topAnchor.constraint(equalTo: andesCodeTextFieldView.topAnchor),
            bottomAnchor.constraint(equalTo: andesCodeTextFieldView.bottomAnchor)
        ])
    }

    func setupTextFields() {
        let textFieldsArray = getTextFieldsArray()
        textFieldsArray.forEach {
            $0.delegate = self
            $0.textInputTraits = .numberPad
        }
    }

    func setupConstraints() {
        helpLabelLeadingIconConstraint = helpLabel.leftAnchor.constraint(equalTo: helperIconImageView.rightAnchor, constant: 6)
        helpLabelLeadingConstraint = helpLabel.leadingAnchor.constraint(equalTo: andesCodeTextFieldView.leadingAnchor, constant: 2)
    }

    func updateView() {
        updateIcon()
        updateLabel(text: config.labelText, label: label, style: config.labelStyle)
        updateLabel(text: config.helperText, label: helpLabel, style: config.helperStyle)
        updateState()
    }

    func updateIcon() {
        if let icon = config.helperIcon, !icon.isEmpty {
            helperIconImageView.isHidden = false
            AndesIconsProvider.loadIcon(name: icon, placeItInto: helperIconImageView)
            helperIconImageView.tintColor = config.helperIconTintColor
            helperIconImageView.backgroundColor = config.helperIconBgColor
            helpLabelLeadingConstraint.isActive = false
            helpLabelLeadingIconConstraint.isActive = true
        } else {
            helperIconImageView.isHidden = true
            helpLabelLeadingIconConstraint.isActive = false
            helpLabelLeadingConstraint.isActive = true
        }
    }

    func updateLabel(text: String?, label: UILabel, style: AndesFontStyle) {
        guard let txt = text, !txt.isEmpty else {
            label.text = ""
            label.isHidden = true
            return
        }
        label.text = txt
        label.isHidden = false
        label.setAndesStyle(style: style)
    }

    func updateState() {
        getTextFieldsArray().forEach {
            switch config.state {
            case .IDLE:
                $0.state = .idle
            case .ERROR:
                $0.state = .error
            case .DISABLED:
                $0.state = .disabled
            }
        }
    }

    func updateText() {
        text = getTextFromTextFields()
    }

    func hasDecimalNumber(_ string: String) -> Bool {
        return string.first(where: { isDecimalNumber(String($0)) }) != nil
    }

    func isDecimalNumber(_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    func setTextAlignment(_ textField: AndesTextField, _ textAlignment: NSTextAlignment) {
        if let textField = textField.contentView as? AndesTextFieldAbstractView {
            (textField.fieldView as? UITextField)?.textAlignment = textAlignment
        }
    }

    func getTextFieldsArray() -> [AndesTextField] {
        return stackView.arrangedSubviews.compactMap { $0 as? AndesTextField }
    }

    func getSelectedIndex(_ textField: AndesTextField) -> Int {
        for (index, andesTextField) in getTextFieldsArray().enumerated() where andesTextField === textField {
            return index
        }
        return 0
    }

    func isLastTextField(_ textField: AndesTextField) -> Bool {
        return textField === getTextFieldsArray().last
    }

    func allTextFieldsCompleted() -> Bool {
        return getTextFieldsArray().first(where: { $0.text.isEmpty }) == nil
    }

    func fillTextFieldsWith(text: String, from startIndex: Int) {
        let characters = Array(text)
        var textIndex = 0
        for (index, textField) in getTextFieldsArray().enumerated() where index >= startIndex && textIndex < characters.count {
            textField.text = String(characters[textIndex])
            textIndex += 1
        }
    }

    func setFocusOnTextFieldWith(index: Int, deleteBackwardPressed: Bool) {
        let textFieldsArray = getTextFieldsArray()
        if index < textFieldsArray.count {
            if deleteBackwardPressed { textFieldsArray[index].text = "" }
            textFieldsArray[index].becomeFirstResponder()
        } else if let lastTextField = textFieldsArray.last, !lastTextField.text.isEmpty {
            setTextAlignment(lastTextField, .right)
        }
    }

    func getNumericCharactersFrom(text: String) -> String {
        let numericCharacters = Array(text.filter { isDecimalNumber(String($0)) })
        return String(numericCharacters)
    }

    func getTextFromTextFields() -> String {
        var text = ""
        getTextFieldsArray().forEach { text.append($0.text) }
        return text
    }

    func cleanTextFields() {
        getTextFieldsArray().forEach { $0.text = "" }
    }

    func getFirstAvailableTextFieldIndex() -> Int {
        for (index, textField) in getTextFieldsArray().enumerated() where textField.text.isEmpty {
            return index
        }
        return getTextFieldsArray().count - 1
    }
}

// MARK: AndesTextFieldDelegate
extension AndesTextFieldCodeAbstractView: AndesTextFieldDelegate {
    func andesTextField(_ textField: AndesTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return hasDecimalNumber(string) || string.isEmpty
    }

    func andesTextFieldShouldBeginEditing(_ textField: AndesTextField) -> Bool {
        let textFieldsArray = getTextFieldsArray()

        // An empty textField is focusable if previous textField is already filled
        let selectedIndex = getSelectedIndex(textField)
        if textField.text.isEmpty, selectedIndex > 0 {
            if !textFieldsArray[selectedIndex - 1].text.isEmpty {
                 return true
            } else {
                setFocusOnTextFieldWith(index: getFirstAvailableTextFieldIndex(), deleteBackwardPressed: false)
                return false
            }
        }

        // A textField that is not empty is only focusable when it is the last textField
        if !textField.text.isEmpty, !isLastTextField(textField) {
            setFocusOnTextFieldWith(index: getFirstAvailableTextFieldIndex(), deleteBackwardPressed: false)
            return false
        }

        // Fix textAlignment when last textField is focused and it is not empty
        if !textField.text.isEmpty {
            setTextAlignment(textField, .right)
        }
        return true
    }

    func andesTextField(_ textField: AndesTextField, didDeleteBackwardAnd wasEmpty: Bool) {
        // If deleteBackward was pressed and the textField was already empty, focus is set on the previous textField
        if wasEmpty {
            let selectedIndex = getSelectedIndex(textField)
            if selectedIndex > 0 {
                setFocusOnTextFieldWith(index: selectedIndex - 1, deleteBackwardPressed: true)
            }
        }
    }

    func andesTextFieldDidChange(_ textField: AndesTextField) {
        // If text length is greater than 1 means that copy/paste action was made
        if textField.text.count > 1 {
            let numericCharacters = getNumericCharactersFrom(text: textField.text)
            fillTextFieldsWith(text: numericCharacters, from: getSelectedIndex(textField))
            return
        }
        updateText()
        // If textField was filled with one character focus should be set on next textField
        if !textField.text.isEmpty, temporalText == nil {
            setFocusOnTextFieldWith(index: getSelectedIndex(textField) + 1, deleteBackwardPressed: false)
            return
        }

        // If 'text' is empty means that all boxes are empty and that focus should be set on the first textField
        if text.isEmpty {
            setFocusOnTextFieldWith(index: 0, deleteBackwardPressed: false)
        }
        // Fix textAlignment when last textField is focused and it is not empty
        setTextAlignment(textField, .center)
    }
}
