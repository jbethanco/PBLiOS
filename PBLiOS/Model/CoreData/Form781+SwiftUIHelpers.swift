//
//  Form781+SwiftUIHelpers.swift
//  PBLiOS
//

import Foundation

extension Form781{
    
    public var flightsArray: [Flight] {
        let set = flights as? Set<Flight> ?? []
        return Array(set)
    }
    
    public var aircrewDataArray: [AircrewData] {
        let set = aircrewData as? Set<AircrewData> ?? []
        return Array(set)
    }
    
}
