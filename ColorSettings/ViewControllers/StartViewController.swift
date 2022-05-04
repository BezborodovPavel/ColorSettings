//
//  StartViewController.swift
//  ColorSettings
//
//  Created by Павел on 27.04.2022.
//

import UIKit

protocol SettingsColor {
    var backgroundColor: UIColor { get set }
    func setColor()
}

class StartViewController: UIViewController, SettingsColor {
    
    var backgroundColor = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)

    func setColor() {
        view.backgroundColor = backgroundColor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let settingsVC = segue.destination as? SettingsViewContoller else {return}
        
        settingsVC.backgroundColor = backgroundColor
        settingsVC.delegate = self
        
    }

    override func viewDidLoad() {
        setColor()
    }

}

