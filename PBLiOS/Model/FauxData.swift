//
//  FauxData.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/26/20.
//

import Foundation


struct FauxData{
    
    static let icaos = ["RJSM", "KTIK", "KNGB", "RJTY", "KSKA", "KPDX", "PHIK", "RJTA", "RJTZ", "KADW", "KAFF", "KBKF", "KCHS", "KDMA", "KEDW", "KHIF", "KHMN", "KIAB", "KLFI", "KLSV", "KSSC", "KSUU"]
    
    static let dates: [Date] =  {
       
        var dates = [Date]()
        for i in 1..<8{
            let stringDate = "20\(14 + i)-\(i)-\(i * 2)"
            print(stringDate)
            let date = Date("20\(14 + i)-\(i)-\(i * 2)")
            dates.append(date)
        }
        return dates
        
    }()
    
    static let dateTimes: [Date] = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        var dates = [Date]()
        
        for i in 1..<24{
            let hour = String(format: "%02d", i)
            let minute = String(format: "%02d", i + 12)
            
            let month = (i % 11) + 1
            let monthString = String(format: "%02d", month)
            
            let day = String(format: "%02d", i)
            
            let stringDate = "20\(14 + i)-\(monthString)-\(day) \(hour):\(minute)"
            print(stringDate)
            let thisDate = formatter.date(from: stringDate )
            
            dates.append(thisDate!)
        }
         return dates
        
    }()
    
    static let mds = ["C017A", "C005M", "C130H", "KC135A", "KC046", "F035A", "F022A"]
    
    static let issuingUnits = ["0016AS" , "0009AS", "0181AS", "0036AS", "0063ARS", "0056OS", "0003W"]
    
    static let harmLocations = ["JB Charleston", "Dover AFB", "Yokota AB", "Fairchild AFB", "McConnell AFB" , "Luke AFB", "Joint Base Elmendorf-Richardson"]
    
    static let unitCharged = ["437 AW (HQ AMC)/DKFX", "436 AW (AMC)", "374 AW (PACAF)", "92 ARW (AMC)", "22 ARW (AMC)", "61 FS (AETC)", "477 FG (AFRC)"]
    
    static let flightAuthNum: [String] = {
        
        var auths = [String]()
        for i in 0..<7{
            auths.append("\(14 + i)-0\(i * 123))")
        }
        return auths
    }()
    
    static let serialNumbers: [String] = {
        
        var serials = [String]()
        for i in 0..<7{
            serials.append("\(i + 2)-\(i * 11)")
        }
        return serials
    }()
    
}

 
