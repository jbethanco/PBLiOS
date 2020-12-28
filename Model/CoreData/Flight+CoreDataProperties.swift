//
//  Flight+CoreDataProperties.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/26/20.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var fullStop: Int16
    @NSManaged public var fromICAO: String?
    @NSManaged public var toICAO: String?
    @NSManaged public var landTime: Date?
    @NSManaged public var missionNumber: String?
    @NSManaged public var missionSymbol: String?
    @NSManaged public var pilotReviewInitials: String?
    @NSManaged public var sorties: Int16
    @NSManaged public var specialUse: String?
    @NSManaged public var takeOffTime: Date?
    @NSManaged public var totalLandings: Int16
    @NSManaged public var totalTime: Float
    @NSManaged public var touchanAndGo: Int16
    @NSManaged public var form781: Form781?

}

extension Flight : Identifiable {

}
