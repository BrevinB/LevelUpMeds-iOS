//
//  LoginState.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/24/22.
//

import Foundation
import Combine
import FirebaseAuth
import SwiftUI

enum LoginState {
    case successful
    case failed(error: Error)
    case na
}

protocol LoginViewModel {
    func login()
    var state: LoginState { get }
    var credentials: LoginCredentials { get }
    
}

final class LoginViewModelImpl: ObservableObject, LoginViewModel {
    
    
    //@StateObject var sessionService = SessionServiceImpl()
    @Published var state: LoginState = .na
    @Published var credentials: LoginCredentials = LoginCredentials.new
    @Published var alert = false
    @Published var alertMsg = ""
    @Published var isLoading = false
    @Published var doneUploading = false


    
    func login() {
        
        print("LOGIN")
        
        //Check if fields are filled in
        if credentials.email == "" || credentials.password == "" {
            self.alertMsg = "Please fill the content fields properly"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
        }
        
        Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { (result, err) in
            
            
        withAnimation {
            self.isLoading.toggle()
        }
            
            
            if err != nil {
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
        }
        
      
        
        
        //Checking if user is verified or not...
        // if not verified, logged out
        
//        let user = Auth.auth().currentUser
//
//        if !user!.isEmailVerified {
//            self.alertMsg = "Please Verify Email Address"
//            self.alert.toggle()
//            //logging out
//            try! Auth.auth().signOut()
//
//            return
//        }
        
        //Setting user status as true...
        
//        withAnimation {
//            self.state = .successful
//        }
        
        self.state = .successful
        self.doneUploading.toggle()
        
      
    }
}
