//
//  StudentsTableViewController.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/17/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController, AlertHandlerDelegate, updateStudentTableView, PassStudentReferenceDelegate {
    
    
    static var studentsHandler:StudentHandler = StudentHandler()
    var currentStudentCheckedOut = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        StudentsTableViewController.studentsHandler.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddStudent" {
            let addStudentVC = segue.destination as! AddStudentViewController
            addStudentVC.delegate = self
        } else if segue.identifier == "toStudentDisplay" {
            let studentDisplayVC = segue.destination as! StudentDisplayViewController
            studentDisplayVC.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentsTableViewController.studentsHandler.studentList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentCell
        let student = StudentsTableViewController.studentsHandler.student(atIndex: indexPath.row)
        cell.cellStudent = student
        cell.studentName.text = "\(student.firstName!) \(student.lastName!)"
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentStudentCheckedOut = indexPath.row
    }
    
    func errorDidOccur(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateStudentTableView() {
        self.tableView.reloadData()
    }
    
    
    func passStudentReference() -> Student {
        return StudentsTableViewController.studentsHandler.studentList[currentStudentCheckedOut]
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
