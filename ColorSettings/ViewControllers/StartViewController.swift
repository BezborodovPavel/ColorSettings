//
//  StartViewController.swift
//  ColorSettings
//
//  Created by Павел on 27.04.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    var backgroundColor = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let settingsVC = segue.destination as? SettingsViewContoller else {return}
        
        settingsVC.backgroundColor = backgroundColor
        settingsVC.delegate = self
        
    }
    
    func setColor() {
        view.backgroundColor = backgroundColor
    }

    override func viewDidLoad() {
        setColor()
    }

}

