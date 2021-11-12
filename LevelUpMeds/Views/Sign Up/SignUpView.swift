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
    
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                VStack() {
                    Spacer()
                    
                    VStack {
                        BannerImmage(image: Image("logo"))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("Dark Grey"))
                    .padding()
                    
                    
                    Spacer()
                    
                    //VStack for First Name Field
                    VStack(alignment: .leading) {
                        TextField("First Name", text: $firstName)
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .padding(20)
                    }
                 
                    //VStack for First Name Field
                    VStack(alignment: .leading) {
                        TextField("Last Name", text: $lastName)
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .padding(20)
                    }
                    
                    //VStack for Email
                    VStack(alignment: .leading) {
                        TextField("Email", text: $email)
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .padding(20)
                            
                    }
                    
                    //VStack for Password && Password checking
                    VStack(alignment: .leading) {
                        SecureField("Password", text: $password)
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .padding(20)
                        SecureField("Confirm Password", text: $confirmedPassword)
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .padding(20)
                        
                       
                    }
                    .padding([.bottom], 50)
                    
//                    Button(action: submitSignUp) {
//
//                        HStack {
//                            Text("Submit")
//                        }
//                        .padding()
//                        .frame(width: 250, height: 60)
//                    }
//                        .foregroundColor(.black)
//                        .buttonStyle(.borderedProminent)
//                        .buttonBorderShape(.capsule)
//                        .tint(Color("Bright Orange"))
                    NavigationLinkButtons(text: "Submit",
                                          color: "Bright Orange",
                                          view: AnyView(MedicationSignUpSelection()))
                        

                    
                    Spacer()
                    Spacer()
                    
                }
                .font(.title)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("**Sign Up**").font(.title)
                                .foregroundColor(.black)
                                .padding()
                           
                        }
                    }

            }
            }
        }
        .foregroundColor(.black)
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
.previewInterfaceOrientation(.portrait)
    }
}

//func submitSignUp() {
//    if let window = UIApplication.shared.windows.first {
//        window.rootViewController = UIHostingController(rootView: MedicationSignUpSelection())
//        window.makeKeyAndVisible()
//    }
//}

