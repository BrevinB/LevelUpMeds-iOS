//
//  SignUpView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/3/21.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @State private var passwordIsEqual = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                BannerImmage(image: Image("logo"))
            }
            .background(Color("Bright Orange"))
            
            Spacer()
            
            Text("Register:")
                .padding()
            
            //VStack for First Name Field
            VStack(alignment: .leading) {
                TextField("First Name", text: $firstName)
            }.padding()
           
            //VStack for First Name Field
            VStack(alignment: .leading) {
                TextField("Last Name", text: $lastName)
            }.padding()
            
            //VStack for Email
            VStack(alignment: .leading) {
                TextField("Email", text: $email)
            }.padding()
            
            //VStack for Password && Password checking
            VStack(alignment: .leading) {
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $confirmedPassword)
                
               
            }.padding()
            
            
            Spacer()
          
            
        }
        .font(.title)
        
       
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
.previewInterfaceOrientation(.portrait)
    }
}
