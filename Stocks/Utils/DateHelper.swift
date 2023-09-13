//
//  DateHelper.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import Foundation

class DateHelper {
    
    static func getDateString(fromDate date: Date,
                              fromDateFormat dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.system
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
    
}
