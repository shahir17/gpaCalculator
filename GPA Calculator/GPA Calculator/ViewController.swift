//
//  ViewController.swift
//  GPA Calculator
//
//  Created by Shahir Abdul-Satar on 2/8/17.
//  Copyright © 2017 Ahmad Shahir Abdul-Satar. All rights reserved.
//

import UIKit


extension String {
    func substring(from: Int) -> String? {
        guard from < self.characters.count else { return nil }
        let fromIndex = index(self.startIndex, offsetBy: from)
        return substring(from: fromIndex)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var courseTitleTextField: UITextField!
    
    @IBOutlet weak var assignmentPointTextField: UITextField!

    @IBOutlet weak var assignmentMaxTextField: UITextField!
    
    @IBOutlet weak var assignmentPercentageTextField: UITextField!
    
    @IBOutlet weak var midtermPointTextField: UITextField!
    
    @IBOutlet weak var midtermMaxTextField: UITextField!
    
    @IBOutlet weak var midtermPercentageTextField: UITextField!
    
    @IBOutlet weak var finalPointTextField: UITextField!

    @IBOutlet weak var finalMaxTextField: UITextField!
    
    @IBOutlet weak var finalPercentageTextField: UITextField!
    
    @IBOutlet weak var creditsTextField: UITextField!
    
    @IBOutlet weak var deleteCourseTextField: UITextField!
    
    @IBOutlet weak var gpaLabel: UILabel!
    
    @IBOutlet weak var courseOneLabel: UILabel!
    
    @IBOutlet weak var courseTwoLabel: UILabel!
    
    @IBOutlet weak var courseThreeLabel: UILabel!
    
    @IBOutlet weak var courseFourLabel: UILabel!
    
    @IBOutlet weak var addCourseButton: UIButton!
    
    @IBOutlet weak var deleteCourseButton: UIButton!
    
    
    
    
    
    
    var count = 1
    var courseName : String = ""
    
    
    @IBAction func addCourseButton(_ sender: UIButton) {
            deleteCourseButton.isEnabled = false
             courseName = courseTitleTextField.text!
        
        if ((count >= 2) && ((courseOneLabel.text?.contains(courseName))! || (courseTwoLabel.text?.contains(courseName))! || (courseThreeLabel.text?.contains(courseName))!)){
            let alert = UIAlertController(title: "Error", message: "Course already exists", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            count = count - 1
            deleteCourseButton.isEnabled = true
        }
        
        

        
        
            if (count == 1) {
                courseOneLabel.text = "1) " + courseName + " | " + creditsTextField.text! + " | " + " " + calculateGrade()
                courseOneLabel.isHidden = false
                
                gpaLabel.text = "GPA: " + calculateGpa(credits: Double(creditsTextField.text!)!)
                deleteCourseButton.isEnabled = true
                        }
            if (count == 2) {
                courseTwoLabel.text = "2) " + courseName + " | " + creditsTextField.text! + " | " + " " + calculateGrade()
                courseTwoLabel.isHidden = false
                
                gpaLabel.text = "GPA: " + calculateGpa(credits: Double(creditsTextField.text!)!)
                deleteCourseButton.isEnabled = true
                
            }
            if (count == 3) {
                courseThreeLabel.text = "3) " + courseName + " | " + creditsTextField.text! + " | " + " " + calculateGrade()
                courseThreeLabel.isHidden = false
                gpaLabel.text = "GPA: " + calculateGpa(credits: Double(creditsTextField.text!)!)
                deleteCourseButton.isEnabled = true
            }
            if (count == 4) {
                courseFourLabel.text = "4) " + courseName + " | " + creditsTextField.text! + " | " + " " + calculateGrade()
                courseFourLabel.isHidden = false
                gpaLabel.text = "GPA: " + calculateGpa(credits: Double(creditsTextField.text!)!)
                deleteCourseButton.isEnabled = true
            }
        if (count > 4){
            let alert = UIAlertController(title: "Alert", message: "Maximum number of courses added", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            deleteCourseButton.isEnabled = true
        }
        if (gpaNumber <= 4.0 && gpaNumber >= 3.0){
            gpaLabel.textColor = UIColor.green
        }
        if (gpaNumber <= 3.0 && gpaNumber >= 2.0){
            gpaLabel.textColor = UIColor.orange
        }
        if (gpaNumber < 2.0){
            gpaLabel.textColor = UIColor.red
        }

        
        
        count += 1
        
        
        
        }
    
    
    var courseID = ""
    
    @IBAction func deleteCourseButton(_ sender: UIButton) {
        courseID = deleteCourseTextField.text!
        
        if ((courseID == "1") && (count > 1)){
            courseOneLabel.text = ""
            
            
        }
        else if ((courseID == "2") && (count > 1)){
            courseTwoLabel.text = ""
            
            
            courseFourLabel.text = ""
        }
        else if ((courseID == "3") && (count > 1)){
            courseThreeLabel.text = ""
            
            
            
        }
        else if ((courseID == "4") && (count > 1)){
            courseFourLabel.text = ""
            
        }
        
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for label in [courseOneLabel, courseTwoLabel, courseThreeLabel, courseFourLabel]{
            label?.isHidden = true
        }
        
        
       
        print(calculateGrade())
        print()
                
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
  
    //function for deleting course
    func deleteCourse(){
        
    }
    var letterGrade : String = ""
    //function for grade calculation
    func calculateGrade() -> String {
        
        //convert textfield string to int for assignments, midterm, final
        let assignmentPoint = Double(assignmentPointTextField.text!)
        let assignmentMax = Double(assignmentMaxTextField.text!)
        let assignmentPercent = Double(assignmentPercentageTextField.text!)
        let midtermPoint = Double(midtermPointTextField.text!)
        let midtermMax = Double(midtermMaxTextField.text!)
        let midtermPercent = Double(midtermPercentageTextField.text!)
        let finalPoint = Double(finalPointTextField.text!)
        let finalMax = Double(finalMaxTextField.text!)
        let finalPercent = Double(finalPercentageTextField.text!)
        
        if (assignmentPoint! > assignmentMax!){
            let alert = UIAlertController(title: "Error", message: "Assignment points is greater than maximum points", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        if (midtermPoint! > midtermMax!){
            let alert = UIAlertController(title: "Error", message: "Midterm points is greater than maximum points", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        if (finalPoint! > finalMax!){
            let alert = UIAlertController(title: "Error", message: "Final points is greater than maximum points", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        var percentTotal = (assignmentPercent!)
        percentTotal += (midtermPercent!)
        percentTotal += (finalPercent!)
        if (percentTotal != 100) {
            let alert = UIAlertController(title: "Error", message: "Percent values do not sum to 100", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        //calculate amount of
        
            
            let aTotal = ((assignmentPoint!/assignmentMax!)*assignmentPercent!)
            let mTotal = ((midtermPoint!/midtermMax!)*midtermPercent!)
            let fTotal = ((finalPoint!/finalMax!)*finalPercent!)
        
            let grade = (aTotal + mTotal + fTotal)
        
            letterGrade = ""
        
            if (grade <= 100.00 && grade >= 90.00) {
            
                letterGrade = "A"
            
            }
            if (grade <= 89.99 && grade >= 80.00){
                letterGrade = "B"
        }
            if (grade <= 79.99 && grade >= 70.00){
            letterGrade = "C"
        }
            if (grade <= 69.99 && grade >= 60.00){
            letterGrade = "D"
        }
            if (grade < 60.00){
            letterGrade = "F"
        }
        
        return letterGrade
        
        
        
        
    }
    var weight : Double = 0.0
    var gpa : String = ""
    var points : Double = 0.0
    var cred : Double = 0.0
    var num = 1
    var gpaNumber : Double = 0.0
    func calculateGpa(credits: Double) -> String {
        if (num <= 4){
        if (letterGrade == "A"){
            weight = 4.0
            
        }
        if (letterGrade == "B"){
            weight = 3.0
        }
        if (letterGrade == "C"){
            weight = 2.0
        }
        if (letterGrade == "D"){
            weight = 1.0
        }
        if (letterGrade == "F"){
            weight = 0.0
        }
        points += (weight * credits)
        cred += credits
            gpaNumber = (points/cred)
            gpa = String(format: "%.2f", gpaNumber)
        }
        return gpa
        
    }

}

