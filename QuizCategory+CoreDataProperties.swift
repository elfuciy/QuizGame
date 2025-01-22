//
//  QuizCategory+CoreDataProperties.swift
//  QuizGameMidApp
//
//  Created by Elsever on 11.01.25.
//
//

import Foundation
import CoreData


extension QuizCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuizCategory> {
        return NSFetchRequest<QuizCategory>(entityName: "QuizCategory")
    }

    @NSManaged public var category: String?
    @NSManaged public var categoryColor: String?
    @NSManaged public var categoryImage: String?
    @NSManaged public var lastQuestion: Int16
    @NSManaged public var miniImage: String?
    @NSManaged public var percent: Double
    @NSManaged public var user: String?

}

extension QuizCategory : Identifiable {

}
