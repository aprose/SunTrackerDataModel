//
//  UVInformation+CoreDataProperties.swift
//  WatchTheSun WatchKit Extension
//
//  Created by user178036 on 11.02.21.
//
//

import Foundation
import CoreData


extension UVInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UVInformation> {
        return NSFetchRequest<UVInformation>(entityName: "UVInformation")
    }

    @NSManaged public var currentUVatDateTime: Date?
    @NSManaged public var currentUV: Double
    @NSManaged public var maxUVatDateTime: Date?
    @NSManaged public var maxUV: Double
    @NSManaged public var maxTimeSkinTypeOne: Int32
    @NSManaged public var maxTimeSkinTypeTwo: Int32
    @NSManaged public var maxTimeSkinTypeThree: Int32
    @NSManaged public var maxTimeSkinTypeFour: Int32
    @NSManaged public var maxTimeSkinTypeFive: Int32
    @NSManaged public var maxTimeSkinTypeSix: Int32
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension UVInformation : Identifiable {

}
