//
//  StockNewsView.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import SwiftUI

struct StockNewsView: View {
        
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Business News")
                    .font(.title.weight(.heavy))
                Text("From Yahoo Finance")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .font(.body.weight(.semibold))
            }.padding()
            Divider()
            Spacer()
        }
        .padding(.top)
        .presentationDetents([.height(100), .medium, .fraction(0.95)])
        .presentationDragIndicator(.visible)
        .presentationBackgroundInteraction(.enabled)
        .interactiveDismissDisabled()
    }
}

struct StockNewsView_Previews: PreviewProvider {
    static var previews: some View {
        StockNewsView()
    }
}
