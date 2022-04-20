//
//  ViewController.swift
//  ColorSettings
//
//  Created by Павел on 19.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForColor: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var bluValueLabel: UILabel!
    
    private var redValue: Float = 0 {
        didSet{
            let roundedRedValue = round(redValue * 100) / 100
            redValueLabel.text = String(roundedRedValue)
            changeColorView()
        }
    }
    
    private var greenValue: Float = 0 {
        didSet{
            let roundedGreenValue = round(greenValue * 100) / 100
            greenValueLabel.text = String(roundedGreenValue)
            changeColorView()
        }
    }
    
    private var blueValue: Float = 0 {
        didSet{
            let roundedBlueValue = round(blueValue * 100) / 100
            bluValueLabel.text = String(roundedBlueValue)
            changeColorView()
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
    
    private func changeColorView() {
        viewForColor.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue), alpha: 1
        )
    }
}

