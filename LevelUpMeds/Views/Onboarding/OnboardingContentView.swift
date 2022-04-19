//
//  OnboardingContentView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 3/21/22.
//

import SwiftUI
import UserNotifications

struct OnboardingContentView: View {
    
    @AppStorage("needsAppOnBoarding") var needsAppOnboarding: Bool?
    
    var title: String = ""
    var description: String = ""
    var image: String = ""
    var lastScreen: Bool = false
    var notification: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color("Bright Orange"), Color("Croci Yellow")]), startPoint: .topLeading, endPoint: .bottomLeading)
                
                VStack {
                    Spacer()
                    Text(title)
                        .fontWeight(.heavy)
                        .font(.system(size:40))
                        .frame(width: 300, alignment: .leading)
                    Spacer()
                    if image != "" {
                        OnboardingImage(image: image)
                    }
                    
                
                    Spacer()
                    Text(description)
                        .font(.title3)
                    
                    if lastScreen {
                        Button(action: {
                            needsAppOnboarding = false
                        }, label: {
                            Text("Done")
                                .padding()
                                .background(
                                    Capsule().strokeBorder(Color.white, lineWidth: 1.5)
                                        .frame(width: 100)
                                )
                        })
                    }
                    
                    if notification {
                        Button(action: {
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    NotificationService.shared.scheduleNotifications()
                                    print("success")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                        }, label: {
                            Text("Enable Notifications")
                                .padding()
                                .background(
                                    Capsule().strokeBorder(Color.white, lineWidth: 1.5)
                                        .frame(width: 200)
                                )
                        })
                    }
                    Spacer()
                    
                }
            }
           
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView(title: "Welcome To LevelUpMeds!", description: "Swipe to view some of the apps features!", image: "profiles")
    }
}
