//
//  Form781+CoreDataProperties.swift
//  PBLiOS
//

import Foundation
import CoreData


extension Form781 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Form781> {
        return NSFetchRequest<Form781>(entityName: "Form781")
    }

    @NSManaged public var armsAuditDate: Date?
    @NSManaged public var armsAuditInitials: String?
    @NSManaged public var armsInputDate: Date?
    @NSManaged public var armsInputInitials: String?
    @NSManaged public var date: Date?
    @NSManaged public var extractCertificationBranch: String?
    @NSManaged public var extractCertificationDSN: String?
    @NSManaged public var extractCertificationPrintName: String?
    @NSManaged public var extractCertificationRank: String?
    @NSManaged public var flightAuthNum: String?
    @NSManaged public var grandTotalFullStop: Int16
    @NSManaged public var grandTotalLandings: Int16
    @NSManaged public var grandTotalSorties: Int16
    @NSManaged public var grandTotalTime: Float
    @NSManaged public var grandTotalTouchAndGo: Int16
    @NSManaged public var harmLocation: String?
    @NSManaged public var issuingUnit: String?
    @NSManaged public var maintenanceReview: String?
    @NSManaged public var mds: String?
    @NSManaged public var sarmReview: String?
    @NSManaged public var serialNumber: String?
    @NSManaged public var unitCharged: String?
    @NSManaged public var remarks: String?
    @NSManaged public var aircrewData: NSSet?
    @NSManaged public var flights: NSSet?

}

// MARK: Generated accessors for aircrewData
extension Form781 {

    @objc(addAircrewDataObject:)
    @NSManaged public func addToAircrewData(_ value: AircrewData)

    @objc(removeAircrewDataObject:)
    @NSManaged public func removeFromAircrewData(_ value: AircrewData)

    @objc(addAircrewData:)
    @NSManaged public func addToAircrewData(_ values: NSSet)

    @objc(removeAircrewData:)
    @NSManaged public func removeFromAircrewData(_ values: NSSet)

}

// MARK: Generated accessors for flights
extension Form781 {

    @objc(addFlightsObject:)
    @NSManaged public func addToFlights(_ value: Flight)

    @objc(removeFlightsObject:)
    @NSManaged public func removeFromFlights(_ value: Flight)

    @objc(addFlights:)
    @NSManaged public func addToFlights(_ values: NSSet)

    @objc(removeFlights:)
    @NSManaged public func removeFromFlights(_ values: NSSet)

}

extension Form781 : Identifiable {

}
