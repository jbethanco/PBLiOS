//
//  Form781+SwiftUIHelpers.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/26/20.
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
