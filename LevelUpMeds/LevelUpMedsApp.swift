//
//  LevelUpMedsApp.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/3/21.
//

import SwiftUI
import Firebase

@main
struct LevelUpMedsApp: App {
    
    @StateObject var sessionService = SessionServiceImpl()
    @StateObject var signUp = RegistrationViewModelImpl()

    
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
        
            NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    
                    if signUp.isMedicationSetup {
                        CaretakerView()
                            .environmentObject(sessionService)
                    } else {
                        MedicationSetup()
                            .environmentObject(sessionService)
                    }
                   
                case .loggedOut:
                    LoginView()
                        .environmentObject(sessionService)
                    //CaretakerView()
                }
            }
            
        }
    }
}
