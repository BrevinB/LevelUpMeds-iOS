//
//  SignUpViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/28/22.
//

import Foundation
import FirebaseAuth
import SwiftUI


class SignUpViewModel: ObservableObject {
    
    @ObservedObject var uerViewModel = profileViewModel()
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            //success
        }
    }
}
