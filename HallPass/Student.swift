//
//  Student.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/9/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import Foundation

class Student {
    //Whenever we get the name we will have to check and unwrap it.
    var firstName: String
    var lastName: String
    var monthCount: Int = 0
    var weekCount: Int = 0
    var demerits: Int = 0
    var attributes: [Attributes]?
    
    init (givenFirstName: String?, givenLastName: String?, givenAttributes: [Attributes]?) {
        firstName = givenFirstName ?? "Student"
        lastName = givenLastName ?? "Name"
        attributes = givenAttributes
    }
    
    func editName(firstNameChange: String?, lastNameChange: String?) {
        firstName = firstNameChange ?? "Student"
        lastName = lastNameChange ?? "Name"
    }
    
    func editAttributes(attributeChange: [Attributes]) {
        attributes = attributeChange
    }
    
    func getFirstName()->String {
        return firstName
    }
    
    func getLastName()->String {
        return lastName
    }
    
    
}

enum Attributes {
    case Female, atrribute_1, attribute_2, attribute_3
}
