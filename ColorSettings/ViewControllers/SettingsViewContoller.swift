//
//  ViewController.swift
//  ColorSettings
//
//  Created by Павел on 19.04.2022.
//

import UIKit

class SettingsViewContoller: UIViewController {

    @IBOutlet weak var viewForColor: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var bluValueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField! {
        didSet{
            addCustomToolBar(for: redTextField)
        }
    }
    
    @IBOutlet weak var greenTextField: UITextField! {
        didSet{
            addCustomToolBar(for: greenTextField)
        }
    }
    
    @IBOutlet weak var blueTextField: UITextField! {
        didSet{
            addCustomToolBar(for: blueTextField)
        }
    }
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    private var redValue: Float = 0 {
        didSet{
            let roundedRedValue = round(redValue * 100) / 100
            redValueLabel.text = String(roundedRedValue)
            redTextField.text = String(roundedRedValue)
            redSlider.setValue(redValue, animated: true)
            changeColorView()
        }
    }
    
    private var greenValue: Float = 0 {
        didSet{
            let roundedGreenValue = round(greenValue * 100) / 100
            greenValueLabel.text = String(roundedGreenValue)
            greenTextField.text = String(roundedGreenValue)
            greenSlider.setValue(greenValue, animated: true)
            changeColorView()
        }
    }
    
    private var blueValue: Float = 0 {
        didSet{
            let roundedBlueValue = round(blueValue * 100) / 100
            bluValueLabel.text = String(roundedBlueValue)
            blueTextField.text = String(roundedBlueValue)
            blueSlider.setValue(blueValue, animated: true)
            changeColorView()
        }
    }
    
    var backgroundColor: UIColor!
    var delegate: SettingsColor!
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = sender.value
    }

    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = sender.value
   }
    
    @IBAction func bluSliderChanged(_ sender: UISlider) {
        blueValue = sender.value
    }
    
    @IBAction func globalDoneButtonPressed() {
        delegate.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        delegate.setColor()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        viewForColor.layer.cornerRadius = 10
        setStartColor()
        
    }
    
    @objc private func doneButtonPressed() {
        view.endEditing(true)
        getValueFromTextFields()
    }
    
    private func getValueFromTextFields() {
        
        if valueIsCorrect(valueForChecking: redTextField.text ) {
            redValue = Float(redTextField.text ?? "") ?? 0
        }
        
        if valueIsCorrect(valueForChecking: greenTextField.text) {
            greenValue = Float(greenTextField.text ?? "") ?? 0
        }
        
        if valueIsCorrect(valueForChecking: blueTextField.text) {
            blueValue = Float(blueTextField.text ?? "") ?? 0
        }
    }
            
    private func setStartColor() {
        
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        
        backgroundColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: nil)
        
        self.redValue = Float(redValue)
        self.greenValue = Float(greenValue)
        self.blueValue = Float(blueValue)
    }
    
    private func changeColorView() {
        viewForColor.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue), alpha: 1
        )
    }
    
    private func addCustomToolBar(for textField: UITextField) {
        
        let customToolBar = UIToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
        let flexibleSpace = UIBarButtonItem.flexibleSpace()
        customToolBar.setItems([flexibleSpace, doneButton], animated: false)
        customToolBar.sizeToFit()
        textField.inputAccessoryView = customToolBar
        
    }
}

extension SettingsViewContoller {
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        getValueFromTextFields()
    }
    
    private func valueIsCorrect(valueForChecking: String?) -> Bool {
        
        guard let valueFromTextField = Float(valueForChecking ?? "") else {
            
            showAlert(title: "Error value", message: "Enter decimal value")
            
            return false}
        
        if valueFromTextField > 1 || valueFromTextField < 0 {
            showAlert(title: "Error value", message: "Enter value from 0 to 1")
            return false
        }
        
        return true
    }
    
    private func showAlert(title: String, message: String){
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ок", style: .default)
        
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }

}

