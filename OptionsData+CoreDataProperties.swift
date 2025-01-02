//
//  OptionsData+CoreDataProperties.swift
//  QuizGameMidApp
//
//  Created by Elsever on 02.01.25.
//
//

import Foundation
import CoreData


extension OptionsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OptionsData> {
        return NSFetchRequest<OptionsData>(entityName: "OptionsData")
    }

    @NSManaged public var options: String?
    @NSManaged public var option2: String?
    @NSManaged public var option3: String?
    @NSManaged public var category: String?

}

extension OptionsData : Identifiable {

}
