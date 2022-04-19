//
//  CaretakerView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CaretakerView: View {
    
    @StateObject var profileVM = profileViewModel()
    @StateObject var medicationVM = medicationViewModel()
    @StateObject var medHistVM = medHistoryViewModel()
    @StateObject var appointmentVM = appointmentViewModel()
    @StateObject var accountVM = accountViewModel()
    @StateObject var calendarModel = CalendarViewModel()
   
    @State private var tabSelection = 1
    @State private var tappedTwice: Bool  = false
    @State private var dashboard    = UUID()
    @State private var calendar     = UUID()
    @State private var profiles     = UUID()
    @State private var account      = UUID()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
//        profViewModel.fetchData()
//          medicationVM.fetchData()
//        appViewModel.fetchData()
        
    }
    
    var handler: Binding<Int> { Binding(
        get:{self.tabSelection},
        set: {
            if $0 == self.tabSelection {
                tappedTwice = true
            }
            self.tabSelection = $0
        }
    )}
    
    var body: some View {
          
                
                TabView(selection: handler) {
                    
                    
                    DashboardView(appViewModel: appointmentVM, medicationVM: medicationVM)
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
                        .tag(3)
                    
                    
                    CalendarV()
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
                        .tag(1)
                    
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
                    profileVM.fetchData()
                    medicationVM.fetchData()
                    appointmentVM.fetchData()
                }
                
        }
}

struct CaretakerView_Previews: PreviewProvider {
    static var previews: some View {
        CaretakerView()
    }
}
