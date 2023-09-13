//
//  StockListView.swift
//  Stocks
//
//  Created by Punit's MacBook on 12/09/23.
//

import SwiftUI

struct StockListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = StockListViewModel()
    @State private var isShowNews = false
    @State private var searchText = ""
//    @State var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        listView
            .listStyle(.plain)
            .toolbar {
                titleToolbar
                plusButtonToolbar
                bottomToolbar
            }
            .searchable(text: $searchText)
            .onAppear(perform: {
                isShowNews = true
            })
            .sheet(isPresented: $isShowNews) {
                StockNewsView()
                    .preferredColorScheme(colorScheme)
            }
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.stocks) { stockData in
                StockRowView(stockData: stockData)
                    .contentShape(Rectangle())
            }
            .onDelete { viewModel.deleteStock(at: $0) }
        }
    }
    
    private var titleToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            VStack(alignment: .leading, spacing: -4) {
                Text(Helper.appName)
                Text(Helper.currentDate).foregroundColor(Color(uiColor: .secondaryLabel))
            }.font(.title2.weight(.heavy))
                .padding(.bottom)
        }
    }
    
    private var plusButtonToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                viewModel.addStock()
            }) {
                Image(systemName: "plus")
            }
        }
    }
    
    private var bottomToolbar: some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            HStack {
                Button {
                } label: {
                    Text(Helper.yahooText)
                        .font(.caption.weight(.heavy))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                .buttonStyle(.plain)
                Spacer()
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
