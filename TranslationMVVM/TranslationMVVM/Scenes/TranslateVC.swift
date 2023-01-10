//
//  ViewController.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 09/01/2023.
//

import UIKit

class TranslateVC: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var targetLanguageTextField: UITextField!
    @IBOutlet weak var sourceLanguageTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    var selectLanguagePicker = UIPickerView()
    var translateViewModel: TranslateViewModel?
    var lastSelectedTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.makeBorder(color: .lightGray)
        outputLabel.makeCornerRadius()
        setupPickerView()
        translateViewModel = TranslateViewModel(delegate: self)
        translateViewModel?.getLanguageList()
    }
    
    func setupPickerView() {
        selectLanguagePicker.dataSource = self
        selectLanguagePicker.delegate = self
        
        targetLanguageTextField.delegate = self
        sourceLanguageTextField.delegate = self
        
        targetLanguageTextField.inputView = selectLanguagePicker
        sourceLanguageTextField.inputView = selectLanguagePicker
    }

    @IBAction func enterButtonTapped(_ sender: Any) {
        
        let request = TranslateRequest(q: inputTextField.text ?? "", target: targetLanguageTextField.text ?? "", source: sourceLanguageTextField.text ?? "")
        translateViewModel?.getTranslateText(request: request)
    }
}

// MARK: -Picker DataSource
extension TranslateVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return translateViewModel?.languagePickerCount ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return translateViewModel?.getLanguageTitle(row: row)
    }
}

// MARK: -Picker Delegate
extension TranslateVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        guard let languageTitle = translateViewModel?.getLanguageTitle(row: row) else {return}
        if lastSelectedTextField == sourceLanguageTextField {
            sourceLanguageTextField.text = languageTitle
        }else if lastSelectedTextField == targetLanguageTextField {
            targetLanguageTextField.text = languageTitle
        }
        self.view.endEditing(true)
    }
}

extension TranslateVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        lastSelectedTextField = textField
    }
}

extension TranslateVC: TranslateViewModelDelegate {
    func translateText(text: String) {
        outputLabel.text = text
    }
    
    func translateError(errorMessage: String) {
        showAlert(errorMessage)
    }
    
    func updatePickerView() {
        selectLanguagePicker.reloadAllComponents()
    }
}
