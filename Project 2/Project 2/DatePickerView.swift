//
//  DatePickerView.swift
//  Project 2
//
//  Created by Anthony Hanson on 10/30/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class DatePickerView: UIViewController {
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var continueButton: UIButton!
    
    
    
    var targetDate = Date()

    let targetDateString = "12/25/2019"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        targetDate = formatter.date(from: targetDateString)!
        
        updateContinue()
    }
    
    func updateContinue() {
        if Calendar.current.isDate(datePicker.date, inSameDayAs: targetDate) {
        continueButton.isEnabled = true
        spinner.stopAnimating()
        }
        else {
            continueButton.isEnabled = false
            spinner.startAnimating()
        }
    
    }
    
    @IBAction func dateUpdated(_ sender: Any) {
        updateContinue()
    }
    
}
