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
        NavigationView() {
    
            VStack() {
                Spacer()
                VStack {
                    Text(" ")
                }
                .frame(maxWidth: .infinity)
                .background(Color("Dark Grey"))
                
                
                Spacer()
                
                //VStack for First Name Field
                VStack(alignment: .leading) {
                    TextField("First Name", text: $firstName)
                        .padding([.top,.bottom], 2)
                        .padding(.leading, 5)
                        .border(.black)
                        .background(Color.white, alignment: .center)
                        .padding()
                }
             
                //VStack for First Name Field
                VStack(alignment: .leading) {
                    TextField("Last Name", text: $lastName)
                        .padding([.top,.bottom], 2)
                        .padding(.leading, 5)
                        .border(.black)
                        .background(Color.white, alignment: .center)
                        .padding()
                }
                
                //VStack for Email
                VStack(alignment: .leading) {
                    TextField("Email", text: $email)
                        .padding([.top,.bottom], 2)
                        .padding(.leading, 5)
                        .border(.black)
                        .background(Color.white, alignment: .center)
                        .padding()
                        
                }
                
                //VStack for Password && Password checking
                VStack(alignment: .leading) {
                    SecureField("Password", text: $password)
                        .padding([.top,.bottom], 2)
                        .padding(.leading, 5)
                        .border(.black)
                        .background(Color.white, alignment: .center)
                        .padding()
                    SecureField("Confirm Password", text: $confirmedPassword)
                        .padding([.top,.bottom], 2)
                        .padding(.leading, 5)
                        .border(.black)
                        .background(Color.white, alignment: .center)
                        .padding()
                    
                   
                }
                .padding([.bottom], 50)
                
                Button(action: {
                    print("Setup!")
                }) {
                    
                    HStack {
                        Text("Submit")
                    }
                    .padding()
                    .frame(width: 250, height: 60)
                }
                    .foregroundColor(.black)
                    .background(Color("Bright Orange"))
                    .cornerRadius(20)
                
                Spacer()
                Spacer()
                
            }
            .font(.title)
            .background(Color("Creamy Blue"))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // <2>
                ToolbarItem(placement: .principal) { // <3>
                    VStack {
                        Text("Register").font(.title)
                            .foregroundColor(.white)
                       
                    }
                }

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
.previewInterfaceOrientation(.portrait)
    }
}
