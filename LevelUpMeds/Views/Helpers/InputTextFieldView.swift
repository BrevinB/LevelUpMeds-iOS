//
//  InputTextFieldView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/22/22.
//

import SwiftUI

struct InputTextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    
    
    var body: some View {
        
        TextField(placeholder, text: $text)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .frame(maxWidth: 300, minHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .keyboardType(keyboardType)
            .background(
            
                ZStack(alignment: .leading) {
                    if let systemImage = sfSymbol {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray.opacity(0.25))
                }
            
            )
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputTextFieldView(text: .constant(""),
                               placeholder: "Email",
                               keyboardType: .emailAddress,
                               sfSymbol: "envelope")
                .preview(with: "Email Text Input with SFSymbol")
            
            InputTextFieldView(text: .constant(""),
                               placeholder: "First Name",
                               keyboardType: .default,
                               sfSymbol: nil)
                .preview(with: "First Name Text Input Without SFSymbol")
        }
    }
}
