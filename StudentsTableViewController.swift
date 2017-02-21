//
//  StudentsTableViewController.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/17/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    
    static var studentsHandler:StudentHandler = StudentHandler(premadeStudentArray: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        let student = StudentsTableViewController.studentsHandler.student(atIndex: indexPath.row) ?? Student(givenFirstName: nil, givenLastName: nil, givenAttributes: nil)
        cell.studentName.text = "\(student.getFirstName()) \(student.getLastName())"
        
        // Configure the cell...
        
        return cell
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
