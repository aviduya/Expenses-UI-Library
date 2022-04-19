//
//  InputValueFied.swift
//  
//
//  Created by Anfernee Viduya on 4/14/22.
//

import SwiftUI

public struct InputValueField: View {
    
    @Binding var input: Double?
    @Binding var isValidated: Bool
    
    let material: Material = .thin
    
    public init(input: Binding<Double?>, isValidated: Binding<Bool>) {
        self._input = input
        self._isValidated = isValidated
    }
    
    public var body: some View {
        HStack {
            Image(systemName: "dollarsign")
                .font(.title)
            TextField("Amount...", value: $input, format: .currency(code: "usd"))
                .keyboardType(.decimalPad)
                .font(Font.headline.weight(.bold))
                .onTapGesture {
                    isEmpty()
                }
            Spacer()
            if isValidated != true {
                Image(systemName: "exclamationmark")
                    .font(.title2)
                    .foregroundColor(Color.red)
            }
            
        }
        .onAppear {
           isEmpty()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .clipped()
        .background(material, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
    
      func isEmpty() {
        if input == 0.0 {
            isValidated = true
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InputValueField(input: .constant(0), isValidated: .constant(false))
    }
}
