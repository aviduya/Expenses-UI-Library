//
//  RecentRowView.swift
//  
//
//  Created by Anfernee Viduya on 4/14/22.
//

import SwiftUI

public struct RecentRowView: View {
    
    @Binding var item: String
    @Binding var date: String
    @Binding var amount: Double
    @Binding var category: String
    
    public init(item: Binding<String>, date: Binding<String>, amount: Binding<Double>, category: Binding<String>) {
        self._item = item
        self._date = date
        self._amount = amount
        self._category = category
    }
    
    func convertSymbols(_ category: String) -> String {
        
        switch category.lowercased() {
        case "groceries":
            return "cart"
        case "bills":
            return "list.bullet.rectangle.portrait"
        case "personal":
            return "person.fill"
        case "necesities":
            return "person.text.rectangle.fill"
        case "other":
            return "questionmark"
        default:
            return "xmark.diamond"
        }
    
    }
    
    public var body: some View {
        HStack {
            Image(systemName: convertSymbols(category))
            VStack(alignment: .leading) {
                Text(item)
                    .bold()
                Text(date)
                    .font(.caption)
                    .opacity(0.5)
            }
            Spacer()
            Text("$\(amount, specifier: "%.2f")")
        }
    }
    
    
}
