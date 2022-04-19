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
    @AppStorage("needsAppOnBoarding") private var needsAppOnboarding: Bool = true
    @AppStorage("notificationScheduleSet") private var notificationScheduleSet: Bool = false
    let currentNotification = UNUserNotificationCenter.current()

    
    init() {
        FirebaseApp.configure()
        //FirebaseConfiguration.shared.setLoggerLevel(.min)
    }
   
    var body: some Scene {
        
        
        WindowGroup {
        
            NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    
                    CaretakerView()
                        .environmentObject(sessionService)
                    
                case .loggedOut:
                    
//                    if needsAppOnboarding {
//                        OnboardingContainerView()
//                    } else {
//                        LoginView()
//                            .environmentObject(sessionService)
//                    }
                    
                    LoginView()
                        .environmentObject(sessionService)
                }

            }
            .onAppear() {
                //Check if notification permissions have been asked
                currentNotification.getNotificationSettings(completionHandler: { settings in
                    //if not yet asked, ask and if yes set notification schedule
                    if settings.authorizationStatus == .notDetermined {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                NotificationService.shared.scheduleNotifications()
                                notificationScheduleSet = true
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                        //if already asked check if authorized
                    } else if settings.authorizationStatus == .authorized {
                        //Notification permision already granted set notification schedule if not yet set
                        if !notificationScheduleSet  {
                            NotificationService.shared.scheduleNotifications()
                            notificationScheduleSet = true
                        }
                    }
                })
                
                
                
            }
            
        }
    }
}
