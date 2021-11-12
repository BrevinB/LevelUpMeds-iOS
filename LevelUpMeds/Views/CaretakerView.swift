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
                    
                    
                    CalendarView()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Calendar")
                        }
                        .tag(2)
                    
                    PatientMenuView()
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Profiles")
                        }
                    
                    AccountView()
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Account")
                        }
                        .tag(3)
                }
                .accentColor(Color("Bright Orange"))
                
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
