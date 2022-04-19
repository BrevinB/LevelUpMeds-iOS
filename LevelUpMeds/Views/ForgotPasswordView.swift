//
//  ForgotPasswordView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var alert = false
    @State private var alertMsg = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                ButtonView(title: "Send Password Reset") {
                    //TODO: handle password reset action
                    Auth.auth().sendPasswordReset(withEmail: email) { error in
                        
                        if error != nil {
                            alertMsg = error!.localizedDescription
                            alert.toggle()
                            return
                        }
                        
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }
                
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Reset Password")
            .applyClose()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
