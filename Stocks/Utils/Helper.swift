//
//  Helper.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import Foundation

class Helper {
    
    static let appName = "Stocks"
    
    static let yahooText = "Yahoo! finance"
    
    static var currentDate: String {
        DateHelper.getDateString(fromDate: Date(), fromDateFormat: "dd MMMM")
    }
}
