//
//  Student+CoreDataProperties.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/24/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var monthCount: Int16
    @NSManaged public var weekCount: Int16
    @NSManaged public var demerits: Int16
    @NSManaged public var totalCount: Int16
    @NSManaged public var givenAttributes: Attributes?

}
