//
//  LoginView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecured: Bool = true
    @State var navigationBarBackButtonHidden = true
    
    var gray: String = "Dark Grey"
    var cBlue: String = "Creamy Blue"
    var orange: String = "Bright Orange"
    
    var body: some View {
        
        
        VStack() {
            VStack {
                BannerImmage(image: Image("logo"))
            }
            .background(Color("Bright Orange"))
            Spacer()
            
            HStack() {
                Text("LOGIN")
            }
            .font(.title)
            
            VStack {
                HStack() {
                    Text("Email:")
                        .font(.title)
                    Spacer()
                    
                }
                
                TextField("Enter your Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack {
                HStack() {
                    Text("Password:")
                        .font(.title)
                    Spacer()
                    
                    
                }
                
                ZStack(alignment: .trailing) {
                    if isSecured {
                        SecureField("Enter your Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        TextField("Enter your Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                print("Email is \(email) and password is \(password)")
            }) {
                
                HStack {
                    Text("Submit")
                        .font(.title)
                }
                .padding()
            }
                .background(Color(orange))
                .cornerRadius(40)
             
            

            
            Spacer()
            Spacer()
            Spacer()
        }
        .background(Color(cBlue))
        .foregroundColor(Color(gray))
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
