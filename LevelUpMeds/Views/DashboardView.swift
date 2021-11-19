//
//  DashboardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/13/21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            BackgroundColor(color: "Creamy Blue")
            
            VStack {
            
                VStack {
                    HStack() {
                        Text("Mon ")
                        Text("Tue ")
                        Text("Wed ")
                        Text("Thu ")
                        Text("Fri ")
                        Text("Sat ")
                        Text("Sun ")
                       
                    }
                    HStack() {
                        ZStack {
                           Circle()
                                .stroke(Color("Bright Orange"), lineWidth: 4)
                            Text("11")
                        }
                        .frame(width: 30, height: 30)
                        Text(" 12  ")
                        Text(" 13  ")
                        Text(" 14  ")
                        Text(" 15  ")
                        Text(" 16  ")
                        Text(" 17  ")
                       
                    }
                   
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Calm Grey"))

                Spacer()
            }
            
        }
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
