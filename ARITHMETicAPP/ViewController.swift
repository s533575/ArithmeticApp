
//
//  ViewController.swift
//  The ARITMETic APP
//
//  Created by Suresh on 2/13/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var exerciseTF: UITextField!
    @IBOutlet weak var energyUIL: UILabel!
    @IBOutlet weak var timeUIL: UILabel!
    
    @IBOutlet weak var activityWarning: UILabel!
    @IBOutlet weak var exerciseWarning: UILabel!
    @IBOutlet weak var weightWarning: UILabel!
    
    var activity : String?
    let activity1 = ["Select Activity","Bicycling","Jumping Rope","Running - slow","Running - fast","Tennis","Swimming"]
    
   
    @IBAction func calculate(_ sender: Any) {
        let weight : Double? = Double(weightTF.text!)
        let exercise : Int? = Int(exerciseTF.text!)
        
        if weight != nil && exercise != nil && (activity != nil && activity != "Select Activity")
        {
            activityWarning.text = ""
            weightWarning.text = ""
            exerciseWarning.text = ""
            let exerciseTime = ExerciseCoach.energyConsumed(during: activity!, weight: weight!, time: exercise!)
            let totaltime = ExerciseCoach.timeToLose1Pound(during: activity!, weight: weight!)
            energyUIL.text = String(format:"%.1f",exerciseTime)+" "+"cal"
            timeUIL.text = String(format:"%.1f",totaltime)+" "+"minutes"
        }
        else if(activity == "Select Activity" || activity == "" || activity == nil)
        {
            activityWarning.text = "Please enter valid activity"
            weightWarning.text = ""
            exerciseWarning.text = ""
            
        }
        else if(weight == nil || weight! < 0.0)
        {
            weightWarning.text = "Please enter valid weight"
            activityWarning.text = ""
            exerciseWarning.text = ""
        }
        else if (exercise == nil || exercise! < 0){
            exerciseWarning.text = "Please enter valid time"
            activityWarning.text = ""
            weightWarning.text = ""
            
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        activityTF.text = ""
        weightTF.text = ""
        exerciseTF.text = ""
        energyUIL.text = "0 cal"
        timeUIL.text = "0 minutes"
        activityWarning.text = ""
        weightWarning.text = ""
        exerciseWarning.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createActivityList()
        
    }
    
    
    func createActivityList() {
        let activity_list = UIPickerView()
        activity_list.delegate = self
        activityTF.inputView = activity_list
    }
    
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activity1.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activity1[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activity = activity1[row]
        activityTF.text = activity
    }
}






