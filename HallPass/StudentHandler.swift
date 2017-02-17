//
//  StudentHandler.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/9/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import Foundation

class StudentHandler {
    var studentList:[Student] = []
    
    init(premadeStudentArray:[Student]?) {
        if let nonOptionalStudentArray = premadeStudentArray {
            studentList = nonOptionalStudentArray
        }
    }
    
    func addStudent(student:Student?) -> Bool {
        if let nonOptionalStudent = student {
            studentList.append(nonOptionalStudent)
            return true
        } else {
            return false
        }
    }
    
    func deleteStudent(student: Student) -> Student? {
        var count = 0;
        for x in studentList {
            if (x.getFirstName() ==  student.getFirstName()) && (x.getLastName() == student.getLastName()) {
                let retStudent = studentList.remove(at: count)
                return retStudent
            }
            count += 1
    
        }
        return nil
    }
    
    
}

