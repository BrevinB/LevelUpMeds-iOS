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
        VStack {
            
            
            
            TabView(selection: $tabSelection) {
                
                HomeView(tabSelection: $tabSelection)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("home")
                    }
                    .tag(1)
                
                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }
                    .tag(2)
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
                    .tag(3)
            }
            .background(Color("Creamy Blue"))
            .accentColor(Color("Bright Orange"))
            
        }
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
       
    }
}

struct CaretakerView_Previews: PreviewProvider {
    static var previews: some View {
        CaretakerView()
    }
}
