//
//  AddStudentViewController.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/16/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController, UITextFieldDelegate {

    var femaleAttributePressed:Bool = false
    var attribute1Pressed:Bool = false
    var attribute2Pressed:Bool = false
    var attribute3Pressed:Bool = false
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var Attribute1Button: UIButton!
    @IBOutlet weak var Attribute2Button: UIButton!
    @IBOutlet weak var Attribute3Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.FirstNameTextField.delegate = self
        self.LastNameTextField.delegate = self
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Text Field Behaviors
    @IBAction func clearFirstNameTextField(_ sender: Any) {
        if (FirstNameTextField.text == "First Name") {
            FirstNameTextField.text = ""
        }
    }
    
    @IBAction func clearLastNameTextField(_ sender: Any) {
        if (LastNameTextField.text == "Last Name") {
            LastNameTextField.text = ""
        }
    }
    
    @IBAction func replaceFirstName(_ sender: Any) {
        if (FirstNameTextField.text == "") {
            FirstNameTextField.text = "First Name"
        }
    }
    
    @IBAction func replaceLastName(_ sender: Any) {
        if (LastNameTextField.text == "") {
            LastNameTextField.text = "Last Name"
        }
    }
// Later add functionality that displays warning messages if textfields are left nil
    
//Attribute functionality
    
    @IBAction func femaleAttributePressed(_ sender: Any) {
        if !femaleAttributePressed {
            femaleButton.backgroundColor = UIColor.cyan
            femaleButton.setTitleColor(UIColor.white, for: UIControlState.normal)
            femaleAttributePressed = true
        } else {
            femaleButton.backgroundColor = UIColor.clear
            femaleButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
            femaleAttributePressed = false
        }
    }
    
    @IBAction func Attribute1Pressed(_ sender: Any) {
        if (!attribute1Pressed){
            Attribute1Button.backgroundColor = UIColor.cyan
            Attribute1Button.setTitleColor(UIColor.white, for: UIControlState.normal)
            attribute1Pressed = true
        } else {
            Attribute1Button.backgroundColor = UIColor.clear
            Attribute1Button.setTitleColor(UIColor.blue, for: UIControlState.normal)
            attribute1Pressed = false
        }
    }
    
    @IBAction func Atrribute2Pressed(_ sender: Any) {
        if !attribute2Pressed {
            Attribute2Button.backgroundColor = UIColor.cyan
            Attribute2Button.setTitleColor(UIColor.white, for: UIControlState.normal)
            attribute2Pressed = true
        } else {
            Attribute2Button.backgroundColor = UIColor.clear
            Attribute2Button.setTitleColor(UIColor.blue, for: UIControlState.normal)
            attribute2Pressed = false
        }
    }
    
    @IBAction func Attribute3Pressed(_ sender: Any) {
        if !attribute3Pressed {
            Attribute3Button.backgroundColor = UIColor.cyan
            Attribute3Button.setTitleColor(UIColor.white, for: UIControlState.normal)
            attribute3Pressed = true
        } else {
            Attribute3Button.backgroundColor = UIColor.clear
            Attribute3Button.setTitleColor(UIColor.blue, for: UIControlState.normal)
            attribute3Pressed = false
        }
    }
    
    @IBAction func AddStudentPressed(_ sender: Any) {
        if (FirstNameTextField.text == "First Name") || (LastNameTextField.text == "Last Name") {
            let invalidNameAlert = UIAlertController(title: "Invalid Name Entered", message: "Please enter a correct first and last name.", preferredStyle: UIAlertControllerStyle.alert)
            invalidNameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(invalidNameAlert, animated: true, completion: nil)
        } else {
            var inputtedAttributes:[Attributes] = []
            if femaleAttributePressed {
                inputtedAttributes.append(Attributes.Female)
            }
            if attribute1Pressed {
                inputtedAttributes.append(Attributes.atrribute_1)
            }
            if attribute2Pressed {
                inputtedAttributes.append(Attributes.attribute_2)
            }
            if attribute3Pressed {
                inputtedAttributes.append(Attributes.attribute_3)
            }
            StudentsViewController.studentList.addStudent(student: Student(givenFirstName: FirstNameTextField.text!, givenLastName: LastNameTextField.text!, givenAttributes: inputtedAttributes))
            print(StudentsViewController.studentList.studentList)
            
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
