//
//  DatePickerView.swift
//  
//
//  Created by Anfernee Viduya on 4/14/22.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var input: Date
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $input)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                    .padding()
            }
            .navigationTitle(convertDate(date: input))
        }
    }
    
    private func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM d, YYYY"
        
        return formatter.string(from: date)
    }
}

public struct DatePickerView: View {
    
    let material: Material = .thin
    
    @Binding var date: Date
    
    public init(date: Binding<Date>) {
        self._date = date
    }
    
    public var body: some View {
        HStack {
            Image(systemName: "calendar.circle")
                .font(.title)
            Text(convertDate(date: date))
                .bold()
            Spacer()
            NavigationLink(destination: CalendarView(input: $date)) {
                HStack {
                    Text("Select Date")
                    Image(systemName: "chevron.right")
                }
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .clipped()
        .background(material, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
    
    func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM d, YYYY"
        
        return formatter.string(from: date)
    }
    
}
