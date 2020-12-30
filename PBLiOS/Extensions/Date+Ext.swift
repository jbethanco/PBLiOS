//
//  Date+EXT.swift
//  PBLiOS
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
    func pdfFormTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat     = Constants.pdfFormTime
        return formatter.string(from: self )
    }
     
    // allows initialization of date with: Date("2020-12-24")
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    func stringDecimalHoursTill(date: Date) -> String {
        
        let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: self, to: date)
        let hours = diffComponents.hour ?? 0
        let minutes = diffComponents.minute ?? 0
        let decMinutes = Double(minutes)/60.0
        let total = Double(hours) + decMinutes
        
        return String(format: "%.1f", total)
        
        
    }

}



