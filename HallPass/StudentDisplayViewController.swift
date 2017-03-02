//
//  StudentDisplayViewController.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/24/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit


protocol PassStudentReferenceDelegate {
    func passStudentReference() -> Student
}


class StudentDisplayViewController: UIViewController {
    var delegate: PassStudentReferenceDelegate?
    var currentStudent: Student?

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var weekPassesLabel: UILabel!
    @IBOutlet weak var monthPassesLabel: UILabel!
    @IBOutlet weak var totalPassesLabel: UILabel!
    @IBOutlet weak var demeritsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if delegate != nil {
            currentStudent = delegate?.passStudentReference()
            //print("this happened")
        }
        if let nonOptionalStudent = currentStudent {
            firstNameTextField.text = nonOptionalStudent.firstName!
            lastNameTextField.text = nonOptionalStudent.lastName!
            weekPassesLabel.text = "Hall Passes this week: \(nonOptionalStudent.weekCount)"
            monthPassesLabel.text = "Hall Passes this month: \(nonOptionalStudent.monthCount)"
            totalPassesLabel.text = "Total Hall Passes: \(nonOptionalStudent.totalCount)"
            demeritsLabel.text = "Demerits: \(nonOptionalStudent.demerits)"
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
