//
//  Attributes+CoreDataProperties.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/24/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import Foundation
import CoreData


extension Attributes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Attributes> {
        return NSFetchRequest<Attributes>(entityName: "Attributes");
    }

    @NSManaged public var female: Bool
    @NSManaged public var attribute_1: Bool
    @NSManaged public var attribute_2: Bool
    @NSManaged public var attribute_3: Bool
    @NSManaged public var student: Student?

}
