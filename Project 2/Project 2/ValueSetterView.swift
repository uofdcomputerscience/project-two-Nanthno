//
//  ValueSetterView.swift
//  Project 2
//
//  Created by Anthony Hanson on 10/30/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ValueSetterView: UIViewController {
    
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperValue: UILabel!
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepperValue.text = String(Int(stepper.value))
        sliderValue.text = String(Int(slider.value))
    }
    
    func updateContinue() {
        continueButton.isEnabled = stepper.value == 5 && Int(slider.value) == 5
    }
    
    @IBAction func stepperUpdated(_ sender: Any) {
        stepperValue.text = String(Int(stepper.value))
        
        updateContinue()
    }
    
    @IBAction func sliderUpdated(_ sender: Any) {
        sliderValue.text = String(Int(slider.value))
        
        updateContinue()
    }
}
