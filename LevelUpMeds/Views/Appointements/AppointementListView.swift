//
//  AppointementListView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/6/21.
//

import SwiftUI

struct AppointementListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                
                VStack() {
                
                    ForEach(1..<3) {_ in
                        AppointementCardView()
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
}

struct AppointementListView_Previews: PreviewProvider {
    static var previews: some View {
        AppointementListView()
    }
}
