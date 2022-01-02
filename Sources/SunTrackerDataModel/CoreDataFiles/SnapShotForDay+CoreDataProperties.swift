//
//  SnapShotForDay+CoreDataProperties.swift
//  WatchTheSun WatchKit Extension
//
//  Created by user178036 on 11.02.21.
//
//

import Foundation
import CoreData


extension SnapShotForDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SnapShotForDay> {
        return NSFetchRequest<SnapShotForDay>(entityName: "SnapShotForDay")
    }

    @NSManaged public var todaysDate: Date?
    @NSManaged public var numberOfUpdatesSoFar: Int16
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var amountOfTimeTodayInSun: Double

}

extension SnapShotForDay : Identifiable {

}
