//
//  Entity+CoreDataProperties.swift
//  Photo List
//
//  Created by oktay on 7.07.2023.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var img: Data?

}

extension Entity : Identifiable {

}
