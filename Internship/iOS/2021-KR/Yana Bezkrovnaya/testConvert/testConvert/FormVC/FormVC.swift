//
//  FormVC.swift
//  convertNumberToAnOrdinalNumberString
//
//  Created by mac on 26.09.2021.
//

import UIKit

class FormVC: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
    struct Default {
        static let languages: [String] = ["Українська", "English", "Deutsch"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(1, inComponent: 0, animated: false)
    }


    @IBAction func didPressedConvertButton(_ sender: Any) {
        guard let text = textField.text,
            let number = UInt64(text)
        else { return }
        
        let index = pickerView.selectedRow(inComponent: 0)
        let numberParts = NumberParts(number: number)
        
        var convertedString: String = ""
        
        if index == 0 {
            let ukrainian = UaLanguage(numberParts: numberParts)
            convertedString = ukrainian.convert()
        } else if index == 1 {
            let english = EngLanguage(numberParts: numberParts)
            convertedString = english.convert()
        } else {
            let germany = GerLanguage(numberParts: numberParts)
            convertedString = germany.convert()
        }
        outputLabel.text = convertedString
        
        self.view.endEditing(true)
    }
    

}

extension FormVC : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Default.languages.count
    }
}

extension FormVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Default.languages[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var buttonName: String = ""
        if row == 0 {
            buttonName = "Перетворити"
        } else if row == 1 {
            buttonName = "Convert"
        } else {
            buttonName = "Konvertieren"
        }
        convertButton.setTitle(buttonName, for: .normal)
    }
    
}

extension FormVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 15
    }
}
