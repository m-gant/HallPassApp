//
//  StudentHandler.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/9/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit
import CoreData

protocol AlertHandlerDelegate {
    func errorDidOccur(_ alert: UIAlertController)
}

class StudentHandler {
    private var studentList:[Student] = []
    var delegate: AlertHandlerDelegate? = nil
    
    init() {
        do {
            let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
            let students = try DataController.getContext().fetch(fetchRequest)
            studentList = students
        } catch {
            let alert = UIAlertController(title: "Error Detected", message: "There was an error loading student data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            if delegate != nil {
                delegate?.errorDidOccur(alert)
            }

        }
    }
    
    func addStudent(firstName: String, lastName: String, attributes: [Bool]) -> Student {
        let managedContext = DataController.getContext()
        let student = Student(context: managedContext)
        var studentAttributes = Attributes(context: managedContext)
        studentAttributes.female = attributes[0]
        studentAttributes.attribute_1 = attributes[1]
        studentAttributes.attribute_2 = attributes[2]
        studentAttributes.attribute_3 = attributes[3]
        student.firstName = firstName
        student.lastName = lastName
        student.totalCount = 0
        student.demerits = 0
        student.weekCount = 0
        student.monthCount = 0
        student.givenAttributes = studentAttributes
        studentList.append(student)
        return student
    }
    
    func student(atIndex index: Int) -> Student {
        if (index < studentList.count) {
            return studentList[index]
        } else {
            let managedContext = DataController.getContext()
            let student = Student(context: managedContext)
            var studentAttributes = Attributes(context: managedContext)
            studentAttributes.female = false
            studentAttributes.attribute_1 = false
            studentAttributes.attribute_2 = false
            studentAttributes.attribute_3 = false
            student.firstName = "First Name"
            student.lastName  = "Last Name"
            student.demerits = 0
            student.weekCount = 0
            student.monthCount = 0
            student.givenAttributes = studentAttributes
            return student
        }
        
    }
    
    func count() -> Int {
        return studentList.count
    }
    
    func remove(atIndex index: Int) {
        let managedContext = DataController.getContext()
        managedContext.delete(studentList[index])
        studentList.remove(at: index)
    }
    
    
}

