//
//  SessionService.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/24/22.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum SessionState {
    case loggedIn
    case loggedOut
}

protocol SessionService {
    var state: SessionState { get }
    var userDetails: SessionUserDetails? { get }
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    @Published var loginState = LoginViewModelImpl()
    @Published var registerVM = RegistrationViewModelImpl()
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

private extension SessionServiceImpl {
    
    func setupFirebaseAuthHandler() {
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] res, user in

                guard let self = self else { return }
                self.state = user == nil ? .loggedOut : .loggedIn
                if let uid = user?.uid {
                    self.handleRefresh(with: uid)
                }

            }
        print(self.state)
        
//        if registerVM.doneUploading {
//            self.state = .completeSignUp
//            print(self.state)
//        } else if loginState.doneUploading {
//            self.state = .loggedIn
//            print(self.state)
//        } else {
//            self.state = .loggedOut
//            print(self.state)
//        }
        
    }



func handleRefresh(with uid: String) {
    
    
    print("\(uid) klj;ahdkj;f")
//    Database
//        .database()
//        .reference()
//        .child("Accounts")
//        .child(uid)
//        .observe(.value) { [weak self] snapshot in
//
//            guard let self = self,
//                  let value = snapshot.value as? NSDictionary,
//                  let firstName = value[RegistrationKeys.firstName.rawValue] as? String,
//                  let lastName = value[RegistrationKeys.lastName.rawValue] as? String,
//                  let email = value[RegistrationKeys.email.rawValue] as? String else {
//                      return
//                  }
//
//            DispatchQueue.main.async {
//                self.userDetails = SessionUserDetails(firstName: firstName, lastName: lastName, email: email)
//            }
//        }
    
    }
}
