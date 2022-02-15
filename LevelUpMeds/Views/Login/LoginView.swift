//
//  LoginView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI 

struct LoginView: View {
    
    //@EnvironmentObject var viewModel: LoginViewModel
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    @State private var email = ""
    @State private var password = ""
    
    @StateObject private var vm = LoginViewModelImpl()
    
    
    var body: some View {
        
        ZStack {

            VStack(spacing: 16) {
            
                VStack(spacing: 16) {
                    InputTextFieldView(text: $vm.credentials.email,
                                       
                                       placeholder: "Email",
                                       keyboardType: .emailAddress,
                                       sfSymbol: "envelope")
                    
                    InputPasswordView(password: $vm.credentials.password,
                                      placeholder: "Password",
                                      sfSymbol: "lock")
                }
                
                HStack {
                    Spacer()
                    Button(action: {
        
                        showForgotPassword.toggle()
                        
                    }, label: {
                        Text("Forgot Password?")
                    })
                        .font(.system(size: 16, weight: .bold))
                        .sheet(isPresented: $showForgotPassword, content: {
                            ForgotPasswordView()
                        })
                }
                .padding(.bottom)

                VStack(spacing: 16) {
                    
                    ButtonView(title: "Login") {
                    
                        //vm.login()
    //                    guard !email.isEmpty, !password.isEmpty else {
    //                        return
    //                    }
                        vm.login()
                        
    //                    viewModel.signIn(email: email, password: password)
                    }
                    
                    ButtonView(title: "Register",
                               background: .clear,
                               foreground: Color("Bright Orange"),
                               border: Color("Bright Orange")) {
                            
                        showRegistration.toggle()
                    }
                   .sheet(isPresented: $showRegistration, content: {
                       SignUpView()
                   })
                }
                
    //            Spacer()
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Login")
            .alert(isPresented: $vm.alert, content: {
                Alert(title: Text("Message"), message: Text(vm.alertMsg), dismissButton: .destructive(Text("OK")))
        })
            
            if vm.isLoading {
                LoadingView()
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

