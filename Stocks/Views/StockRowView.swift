//
//  StockRowView.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import SwiftUI

struct StockRowView: View {
    
    let stockData: StockData
    
    var body: some View {
        
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                Text(stockData.symbol).font(.headline.bold())
                Text(stockData.name)
                    .font(.subheadline)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                let strPrice = String(format: "%.2f", stockData.price)
                Text(strPrice)
                priceChangeView(change: stockData.change)
            }
            .font(.headline.bold())
        }
    }
    
    @ViewBuilder
    func priceChangeView(change: String) -> some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(change.hasPrefix("-") ? .red : .green)
                .frame(height: 24)
            Text(change)
                .foregroundColor(.white)
                .font(.caption.bold())
                .padding(.horizontal, 8)
        }
        .fixedSize()
    }
    
}

struct StockRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StockRowView(stockData: StockData(symbol: "APPL", name: "Apple Inc.", price: 179.36, change: "+1.18"))
            Divider()
            StockRowView(stockData: StockData(symbol: "NKE", name: "NIKE, Inc.", price: 96.79, change: "-0.34"))
        }.padding()
    }
}
