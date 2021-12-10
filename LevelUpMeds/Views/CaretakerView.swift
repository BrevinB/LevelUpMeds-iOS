//
//  CaretakerView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CaretakerView: View {
    @State private var tabSelection = 1
    @State private var tappedTwice  = false
    @State private var dashboard    = UUID()
    @State private var calendar     = UUID()
    @State private var profiles     = UUID()
    @State private var account      = UUID()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    
    var handler:Binding<Int>{ Binding(
        get:{self.tabSelection},
        set: {
            if $0 == self.tabSelection {
                tappedTwice = true
            }
            self.tabSelection = $0
        }
    )}
    
    var body: some View {
        
        ZStack {
            
            BackgroundColor(color: "Creamy Blue")
            
            VStack {
                
                
                TabView(selection: handler) {
                    
                    
                    DashboardView()
                        .id(dashboard)
                        .onChange(of: tappedTwice, perform: { tappedTwice in
                            guard tappedTwice else {return}
                            dashboard = UUID()
                            self.tappedTwice = false
                        })
                        .tabItem {
                            Image(systemName: "person.text.rectangle")
                            Text("Dashboard")
                        }
                        .tag(1)
                    
                    
                    CalendarView()
                        .id(calendar)
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Calendar")
                        }
                        .tag(2)
                    
                    UserProfilesView()
                        .id(profiles)
                        .onChange(of: tappedTwice, perform: { tappedTwice in
                            guard tappedTwice else {return}
                            profiles = UUID()
                            self.tappedTwice = false
                        })
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Profiles")
                        }
                        .tag(3)
                    
                    AccountView()
                        .id(account)
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
