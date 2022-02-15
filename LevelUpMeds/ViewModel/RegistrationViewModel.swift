//
//  RegistrationViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth

enum RegistrationState {
    case successfull
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func register()
//    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
//    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    @ObservedObject var userVM = profileViewModel()
    @Published var isLoading = false
    @Published var doneUploading = false
    @Published var alert = false
    @Published var alertMsg = ""
    @Published var isMedicationSetup = true
//    let service: RegistrationService
    
    var state: RegistrationState = .na
    
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
//    private var subscriptions = Set<AnyCancellable>()
//
//    init(service: RegistrationService) {
//        self.service = service
//    }
    
    func register() {
        
        if userDetails.email == "" || userDetails.password == "" || userDetails.confirmedPassword == "" {
            
            self.alertMsg = "Please fill contents properly"
            self.alert.toggle()
            return
            
        }
        
        if userDetails.password != userDetails.confirmedPassword {
            
            self.alertMsg = "Passwords do not match, please re-enter"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: userDetails.email, password: userDetails.password) { (result, err) in
            
            if err != nil {
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            withAnimation {
                self.isLoading.toggle()
                self.doneUploading.toggle()
            }
            
            
            //TODO: Possible implemtation of sending verification link
//            result?.user.sendEmailVerification(completion: { (err) in
//
//                if err != nil {
//                    self.alertMsg = err!.localizedDescription
//                    self.alert.toggle()
//                    return
//                }
//
//                //Alerting User to verify email:
//                self.alertMsg = "Email Verification has been sent, please check your inbox to verify email"
//                self.alert.toggle()
//            })
            
        }
        
        //userViewModel.addData(fname: Auth.auth().currentUser?.displayName, lname: "")
    }
    
}


