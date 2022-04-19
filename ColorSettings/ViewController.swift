//
//  ViewController.swift
//  ColorSettings
//
//  Created by Павел on 19.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForColor: UIView!
    
    @IBOutlet weak var redValueSlider: UILabel!
    @IBOutlet weak var greenValueSlider: UILabel!
    @IBOutlet weak var bluValueSlider: UILabel!
    
    private var redValue: Float = 0 {
        didSet{
            let roundedRedValue = round(redValue * 100) / 100
            redValueSlider.text = String(roundedRedValue)
            changeColorView(red: redValue, green: greenValue, blue: blueValue)
        }
    }
    
    private var greenValue: Float = 0 {
        didSet{
            let roundedGreenValue = round(greenValue * 100) / 100
            greenValueSlider.text = String(roundedGreenValue)
            changeColorView(red: redValue, green: greenValue, blue: blueValue)
        }
    }
    
    private var blueValue: Float = 0 {
        didSet{
            let roundedBlueValue = round(blueValue * 100) / 100
            bluValueSlider.text = String(roundedBlueValue)
            changeColorView(red: redValue, green: greenValue, blue: blueValue)
        }
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = sender.value
    }

    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = sender.value
   }
    
    @IBAction func bluSliderChanged(_ sender: UISlider) {
        blueValue = sender.value
    }
    
    override func viewDidLoad() {
        viewForColor.layer.cornerRadius = 10
    }
    
    private func changeColorView(red: Float, green: Float, blue: Float) {
        viewForColor.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}

