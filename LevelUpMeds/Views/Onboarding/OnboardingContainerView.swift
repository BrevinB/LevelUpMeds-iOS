//
//  OnboardingContainerView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 3/21/22.
//

import SwiftUI

struct OnboardingContainerView: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("Bright Orange"), Color("Croci Yellow")]), startPoint: .topLeading, endPoint: .bottomLeading)
            
            TabView {
                OnboardingContentView(title: "Welcome To LevelUpMeds!", description: "Swipe to view some of the apps features!", image: "logo")
                OnboardingContentView(title: "Profiles", description: "First add a profile! This will be the person(s) or yourself for which you want to track medication", image: "profiles")
                OnboardingContentView(title: "Medication", description: "Then add medications for the profiles!", image: "medication", notification: true)
                OnboardingContentView(title: "Dashboard", description: "Dashboard shows all upcoming medications and appointments for that day", image: "dashboard")
                OnboardingContentView(title: "Calendar", description: "Calendar shows all medications and appointments for a day", image: "calendar")
                OnboardingContentView(title: "That's It!", description: "Enjoy the app!", image: "", lastScreen: true)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        .edgesIgnoringSafeArea(.all)
        }
       
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView()
    }
}
