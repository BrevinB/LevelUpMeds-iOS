//
//  InputPasswordView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/22/22.
//

import SwiftUI

struct InputPasswordView: View {
    
    @Binding var password: String
    @State private var isPrivate: Bool = true
    let placeholder: String
    let sfSymbol: String?
    let isNewPW: Bool
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
       
        ZStack(alignment: .trailing) {
            if isPrivate {
                SecureField(placeholder, text: $password)
                    .textContentType(isNewPW ? .password : .newPassword)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(maxWidth: 300, minHeight: 44)
                    .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
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
            } else {
                TextField(placeholder, text: $password)
                    .textContentType(isNewPW ? .password : .newPassword)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(maxWidth: 300, minHeight: 44)
                    .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
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
            
            Button(action: {
                isPrivate.toggle()
            }, label: {
                Image(systemName: isPrivate ? "eye.slash" : "eye")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.trailing, 5)
                    .foregroundColor(Color("Bright Orange"))
            })
        }
        
       
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordView(password: .constant(""),
                          placeholder: "Password",
                          sfSymbol: "lock",
                          isNewPW: true)
            .preview(with: "Input Password View with sfsymbol")
        
        InputPasswordView(password: .constant(""),
                          placeholder: "Password",
                          sfSymbol: nil,
                          isNewPW: true)
            .preview(with: "Input Password View without sfsymbol")
    }
}
