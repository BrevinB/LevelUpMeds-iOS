//
//  CaretakerView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CaretakerView: View {
    @State private var tabSelection = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    
    var body: some View {
        ZStack {
            
            BackgroundColor(color: "Creamy Blue")
            
            VStack {
                
                TabView(selection: $tabSelection) {
                    
                    
                    DashboardView()
                        .tabItem {
                            Image(systemName: "person.text.rectangle")
                            Text("Dashboard")
                        }
                        .tag(1)
                    
                    
                    CalendarView()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Calendar")
                        }
                        .tag(2)
                    
                    UserProfilesView()
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Profiles")
                        }
                        .tag(3)
                    
                    AccountView()
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Account")
                        }
                        .tag(4)
                }
                .accentColor(.orange)
                .onAppear() {
                    UITabBar.appearance().backgroundColor = .lightGray
                    }
                
            }
            
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
       
    }
}

struct CaretakerView_Previews: PreviewProvider {
    static var previews: some View {
        CaretakerView()
    }
}
