//
//  PickerView.swift
//  Project 2
//
//  Created by Anthony Hanson on 10/30/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class PickerView: UIViewController {
    
    
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carloina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    
    let capitals = ["Alabama": "montgomery", "Alaska": "juneau", "Arizona": "phoenix", "Arkansas": "little rock", "California": "sacramento", "Colorado": "denver", "Connecticut": "hartford", "Delaware": "dover", "Florida": "tallahassee", "Georgia": "atlanta", "Hawaii": "honolulu", "Idaho": "boise", "Illinois": "springfield", "Indiana": "indianapolis", "Iowa": "des moines", "Kansas": "topeka", "Kentucky": "frankfort", "Louisiana": "baton rouge", "Maine": "augusta", "Maryland": "annapolis", "Massachusetts": "boston", "Michigan": "lansing", "Minnesota": "saint paul", "Mississippi": "jackson", "Missouri": "jefferson city", "Montana": "helena", "Nebraska": "lincoln", "Nevada": "carson city", "New Hampshire": "concord", "New Jersey": "trenton", "New Mexico": "santa fe", "New York": "albany", "North Carolina": "raleigh", "North Dakota": "bismarck", "Ohio": "columbus", "Oklahoma": "oklahoma city", "Oregon": "salem", "Pennsylvania": "harrisburg", "Rhode Island": "providence", "South Carloina": "columbia", "South Dakota": "pierre", "Tennessee": "nashville", "Texas": "austin", "Utah": "salt lake city", "Vermont": "montpelier", "Virginia": "richmond", "Washington": "olympia", "West Virginia": "charleston", "Wisconsin": "madison", "Wyoming": "cheyenne"]
    
    var selectedCell = "Alabama"
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var capitalText: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewDidLoad() {
        statePicker.delegate = self
        statePicker.dataSource = self
    }
    
    func updateContinue() {
        continueButton.isEnabled = capitals[selectedCell] == (capitalText.text)!.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    }

    @IBAction func capitalTextUpdated(_ sender: Any) {
        updateContinue()
    }
    
}
extension PickerView: UIPickerViewDataSource, UIPickerViewDelegate {

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = states[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedCell = states[row]
            updateContinue()
    }
    
}
