//
//  RecentRowView.swift
//  
//
//  Created by Anfernee Viduya on 4/14/22.
//

import SwiftUI

public struct RecentRowView: View {
    
    @State var item: String
    @State var date: String
    @State var amount: Double?
    @State var category: String
    
    
    
    public init(item: String, date: String, amount: Double, category: String) {
        self.item = item
        self.date = date
        self.amount = amount
        self.category = category
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
            Divider()
            VStack(alignment: .leading) {
                Text(item)
                    .bold()
                Text(date)
                    .font(.caption)
                    .opacity(0.5)
            }
            Spacer()
            Text("$\(amount ?? 0.0, specifier: "%.2f")")
        }
    }
    
    
}
