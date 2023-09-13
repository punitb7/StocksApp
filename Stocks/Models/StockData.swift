//
//  StockData.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import Foundation

struct StockData: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let price: Double
    let change: String
}
