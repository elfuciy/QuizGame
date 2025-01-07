//
//  Questions+CoreDataProperties.swift
//  QuizGameMidApp
//
//  Created by Elsever on 07.01.25.
//
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions")
    }

    @NSManaged public var answer: String?
    @NSManaged public var category: String?
    @NSManaged public var id: Int16
    @NSManaged public var poitns: Int16
    @NSManaged public var question: String?

}

extension Questions : Identifiable {

}
