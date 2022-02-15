//
//  SignUpView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/3/21.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var userVM = profileViewModel()
    @StateObject private var vm = RegistrationViewModelImpl()
    @StateObject private var accountVM = accountViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var presentMedication = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                VStack(spacing: 32) {
                    VStack( spacing: 16) {
                        
                        InputTextFieldView(text: $vm.userDetails.email,
                                           placeholder: "Email",
                                           keyboardType: .emailAddress,
                                           sfSymbol: "envelope")
                        
                        InputPasswordView(password: $vm.userDetails.password,
                                          placeholder: "Password",
                                          sfSymbol: "lock")
                        
                        InputPasswordView(password: $vm.userDetails.confirmedPassword,
                                          placeholder: "Confirm Password",
                                          sfSymbol: "lock")
                        
                        Divider()
                        
                        InputTextFieldView(text: $vm.userDetails.firstName,
                                           placeholder: "First Name",
                                            keyboardType: .namePhonePad,
                                            sfSymbol: nil)
                        
                        InputTextFieldView(text: $vm.userDetails.lastName,
                                           placeholder: "Last Name",
                                           keyboardType: .namePhonePad,
                                           sfSymbol: nil)
                        
                    }
                    
                    ButtonView(title: "Sign Up") {
                        //TODO: Handle create action HERE
                        vm.register()
                       accountVM.addData(fname: vm.userDetails.firstName,
                                          lname: vm.userDetails.lastName,
                                          email: vm.userDetails.email,
                                          password: vm.userDetails.password)
                        
    //                    guard !email.isEmpty, !password.isEmpty else { return }
//                        viewModel.signUp(email: email, password: password)
                        
                    }
                    
                    
                    
//                    NavigationLinkButtons(text: "Sign Up", color: "Bright Orange", view: AnyView(MedicationSetup()))
                }
                .padding(.horizontal, 15)
                .navigationTitle("Sign Up")
                .applyClose()
                
                if vm.isLoading {
                    LoadingView()
                }
                
                
            }
            //Present allerts for sign up issues here
            .alert(isPresented: $vm.alert, content: {
                Alert(title: Text("Message"), message: Text(vm.alertMsg), dismissButton: .destructive(Text("OK"), action: {
                    //do nothing for now
                    
                    //TODO: handle email verification
                    //if email link sent means closing the signipView
//                    if vm.alertMsg == "Email Verification has been Sent" {
//
//                    }
                    
                }))
            })
            
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}



