//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var stocks: [StockData] = []
    
    func addStock() {
        let randomSymbol = StockSymbols.random()
        let randomPrice = getRandomPrice()
        let randomPriceChange = getRandomPriceChange()
        let newStock = StockData(symbol: randomSymbol.rawValue,
                                 name: randomSymbol.name,
                                 price: randomPrice,
                                 change: randomPriceChange)
        stocks.append(newStock)
    }
    
    func deleteStock(at indexSet: IndexSet) {
        stocks.remove(atOffsets: indexSet)
    }
    
    private func getRandomPrice() -> Double {
        return Double.random(in: 50.0...500.0)
    }
    
    private func getRandomPriceChange() -> String {
        let priceChange = Double.random(in: -30.0...50.0)
        let symbol = priceChange >= 0 ? "+" : "-"
        return "\(symbol)\(String(format: "%.2f", abs(priceChange)))"
    }
}

enum StockSymbols: String, CaseIterable {
    case aapl = "AAPL"
    case goog = "GOOG"
    case tsla = "TSLA"
    case msft = "MSFT"
    case amzn = "AMZN"
    case dis = "DIS"
    case nke = "NKE"
    case sbux = "SBUX"
    
    var name: String {
        switch self {
        case .aapl: return "Apple Inc."
        case .goog: return "Alphabet Inc."
        case .tsla: return "Tesla, Inc."
        case .msft: return "Microsoft Corporation"
        case .amzn: return "Amazon.com, Inc."
        case .dis: return "The Walt Disney Company"
        case .nke: return "NIKE, Inc."
        case .sbux: return "Starbucks Corporation"
        }
    }
    
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> StockSymbols {
        if let stockSymbol = StockSymbols.allCases.randomElement(using: &generator) {
            return stockSymbol
        } else {
            return StockSymbols.aapl
        }
    }
    
    static func random() -> StockSymbols {
        var g = SystemRandomNumberGenerator()
        return StockSymbols.random(using: &g)
    }
}
