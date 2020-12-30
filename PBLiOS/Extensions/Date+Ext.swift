//
//  Date+EXT.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/24/20.
//

import Foundation

extension Date{
    
    func defaultDisplayDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.defaultDisplayDate
        return formatter.string(from: self)
    }
    
    func pdfFormDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.pdfFormDate
        return formatter.string(from: self)
    }
     
    // allows initialization of date with: Date("2020-12-24")
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }

}



