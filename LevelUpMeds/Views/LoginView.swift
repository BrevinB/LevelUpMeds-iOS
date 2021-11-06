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
        
        NavigationView() {
            VStack() {
                VStack {
                    BannerImmage(image: Image("logo"))
                }
                .background(Color("Dark Grey"))
                Spacer()
                
                HStack() {
                    Text("LOGIN")
                }
                .font(.title)
                    
                    
                    
                
                VStack {
                    
                    
                    //Eamil Field Stack
                    HStack (alignment: .center, spacing: 10) {
                        Image(systemName: "person")
                        TextField ("Email", text: $email)
                            .frame(height: 60)
                    }
                    .padding([.top,.bottom], 2)
                    .padding(.leading, 5)
                    .background(Color.white, alignment: .center)
                    .cornerRadius(10)
                    .frame(width: 300)
                    .padding(50)
                //Password Field Stack
                    HStack(alignment: .center, spacing: 10) {
                        
                        Image(systemName: "lock")
                        
                        if isSecured {
                            SecureField("Password", text: $password).frame(height: 60)
                        } else {
                            TextField("Password", text: $password).frame(height: 60)
                        }
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
                    .padding([.top,.bottom], 2)
                    .padding(.leading, 5)
                    .background(Color.white, alignment: .center)
                    .cornerRadius(10)
                    .frame(width: 300)
                }
                
                Spacer()
                
                NavigationLink(destination: CaretakerView()) {
                        Text("Login")
                            .padding()
                            .frame(width: 250, height: 60)
                            .background(Color("Bright Orange"))
                            .cornerRadius(20)
                            .font(.title)
                           }
                 
                

                
                Spacer()
                Spacer()
                Spacer()
            }
            .background(Color(cBlue))
            .foregroundColor(Color(gray))
            .edgesIgnoringSafeArea(.all)
           
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
