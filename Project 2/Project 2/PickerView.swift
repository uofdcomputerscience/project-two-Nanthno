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
    @IBOutlet weak var outputLabel: UILabel!
    
    var outputState = -1
    var outputTexts = ["Congratualations, you finished!", "Wait, why would you do that? You'd already won.", "Ah, there you go, you win now.", "Ok, whatever you did, change it back and just leave it there.", "Good job! Now just leave it alone...", "No! Why?!", "Read this carefully: just... leave it like that.", "And, you didn't. Do you just enjoy messing with me?", "Just make up your mind already! Do you want to win or not?", "AHHH! Stop it!", "I think you just want to see how many text snippets I'm willing to say but I refuse to play your game.", "nope", "nope", "nope", "nope", "Ah, you are a persistant one, aren't you", "You win", "You lose", "You win", "You lose", "Ok, I'm done. I'm going to go get some coffee or something. Knock yourself out with that picker there.", "", "", "", "", "", "", "And, you're still at it. I think I'm just going to sit back and watch you messing with those controls.", "", "", "Still at it. Enjoying yourself, eh?", "", "Do-DO-do-dodo-do-DO-do--do-DO-do-DO-DO-dododododo.", "You like Jepardy?", "You know what, I'm going to go take a nap now. You have fun messing around with all those things. See you later.", "", "", "", "", "", "Ok, seriously, stop. That's I can't go to sleep with all these function calls baraging me.", "And you don't care do you.", "Fine, I'll just put these headphones on. Goodbye."]
    
    override func viewDidLoad() {
        statePicker.delegate = self
        statePicker.dataSource = self
    }
    
    func updateContinue() {
        let shouldEnable = capitals[selectedCell] == (capitalText.text)!.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if continueButton.isEnabled == true && shouldEnable == false {
            incrementOutput()
        }
        continueButton.isEnabled = shouldEnable
    }

    @IBAction func capitalTextUpdated(_ sender: Any) {
        updateContinue()
    }
    
    
    @IBAction func continueTapped(_ sender: Any) {
        if outputState == -1 || outputState % 2 == 1 {
            incrementOutput()
        }
        
    }
    
    func incrementOutput() {
        outputState += 1
        if outputState < outputTexts.count {
            outputLabel.text = outputTexts[outputState]
        }
        else {
            outputLabel.text = ""
        }
        if outputState == 4 {
            DispatchQueue.global().async {
                self.delayedCongrats(val: self.outputState)
            }
        }
    }
    
    
    func delayedCongrats(val: Int) {
        sleep(5)
        if outputState == val {
            DispatchQueue.main.async {
                self.outputLabel.text = "There, see: You Win! \nNow just leave it like that and you will keep winning."
            }
        }
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
