//
//  AccountView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/19/21.
//

import SwiftUI
import FirebaseAuth
import UserNotifications

struct AccountView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    @StateObject var account = accountViewModel()
    
    let email = Auth.auth().currentUser?.email ?? "email@gmail.com"
    let currentNotification = UNUserNotificationCenter.current()
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    
    var body: some View {
       
        VStack {
            
            VStack {
                
                AccountBannerImg()
                
                List {
                    Section {
                        NavigationLink(destination: AccountEditView(), label: {
                            accountRow(title: "Personal Details", icon: "person.circle")
                        })
                        
                        Button(action: {
                            
                            currentNotification.getNotificationSettings(completionHandler: { settings in
                                if settings.authorizationStatus == .notDetermined {
                                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                        if success {
                                           //success
                                        } else if let error = error {
                                            print(error.localizedDescription)
                                        }
                                    }
                                } else if settings.authorizationStatus == .denied {
                                    //notifcation permissions were denied previously, go to settings to change
                                    alertMessage = "Notification permissions have been denied previously, go to settings to re-enable the permission"
                                    showingAlert.toggle()
                                    
                                } else if settings.authorizationStatus == .authorized {
                                    //Notification permision already granted
                                    alertMessage = "Notification permission has already been granted, got to settings to customize"
                                    showingAlert.toggle()
                                }
                            })
                            
                        }, label: {
                            accountRow(title: "Notifications", icon: "bell.badge.fill")
                        })
                        .alert(alertMessage, isPresented: $showingAlert) {
                            Button("Ok", role: .cancel) {}
                        }
                    }
                    
                    Section {
                        
//                        NavigationLink(destination: HelpView(), label: {
//                            accountRow(title: "Help", icon: "questionmark.circle")
//                        })
                        
                        NavigationLink(destination: AboutView(), label: {
                            accountRow(title: "About", icon: "exclamationmark.bubble")
                        })
                        
                        Link("Terms of Service", destination: URL(string: "https://levelup-meds.com/#39d6e247-bdfe-49d8-af55-aaae245817e2")!)
                    }
                }
            }
            
            ButtonView(title: "Logout") {
                sessionService.logout()
            }
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct accountRow: View {
    @State var title: String
    @State var icon: String
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
            Text(title)
        }
    }
    
}
