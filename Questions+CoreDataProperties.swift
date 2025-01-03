//
//  Questions+CoreDataProperties.swift
//  QuizGameMidApp
//
//  Created by Elsever on 03.01.25.
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
    @NSManaged public var isAnswered: Bool
    @NSManaged public var poitns: Int16
    @NSManaged public var question: String?
    @NSManaged public var id: Int16

}

extension Questions : Identifiable {

}
