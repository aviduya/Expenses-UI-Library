//
//  InputTextField.swift
//  
//
//  Created by Anfernee Viduya on 4/14/22.
//

import SwiftUI

public struct InputTextField: View {
    @Binding var input: String
    @Binding var isValidated: Bool
    var placeholder: String
    
    var icon: String {
        let name = placeholder
        
        switch name {
        case "Item...":
            return "tag.circle"
        case "Merchant...":
            return"building.2.crop.circle"
        default:
            return "Error"
        }
        
    }
    
    let material: Material = .thin
    
    public init(input: Binding<String>, placeholder: String, isValidated: Binding<Bool>) {
        self._input = input
        self.placeholder = placeholder
        self._isValidated = isValidated
    }
    
    public var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
            TextField(placeholder, text: $input)
                .font(Font.headline.weight(.bold))
            Spacer()
            if isValidated != true {
                Image(systemName: "exclamationmark.circle")
                    .font(.title2)
                    .foregroundColor(Color.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .clipped()
        .background(material, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

struct MorePreViews: PreviewProvider {
    static var previews: some View {
        InputTextField(input: .constant("Target"), placeholder: "Some Item", isValidated: .constant(false))
        }
}
