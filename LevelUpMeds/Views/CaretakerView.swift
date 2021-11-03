//
//  CaretakerView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CaretakerView: View {
    @State private var tabSelection = 1
    var body: some View {
        VStack {
            HStack {
                BannerImmage(image: Image("logo"))
            }
            .background(Color("Bright Orange"))
            Spacer()
            
            
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
            
        }
        .background(Color("Creamy Blue"))
        .edgesIgnoringSafeArea(.all)
       
    }
}

struct CaretakerView_Previews: PreviewProvider {
    static var previews: some View {
        CaretakerView()
    }
}
