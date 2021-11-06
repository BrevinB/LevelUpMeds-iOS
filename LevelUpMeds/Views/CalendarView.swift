//
//  CalendarView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
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
            .frame(maxWidth: .infinity)
            .border(.black)
            
            VStack() {
               
                Text("10:00 AM - 12:00 PM")
                    .padding()
                Text("Doctor's Appointment")
                    .padding()
            }
            .frame(width: 300, height: 100)
            .border(.black)
            
            VStack() {
               
                Text("5:00 PM")
                    .padding()
                Text("Medication 1")
                    .padding()
            }
            .frame(width: 300, height: 100)
            .border(.black)
            .padding(50)
            
            VStack() {
               
                Text("5 PM")
                    .padding()
                Text("Medication 2")
                    .padding()
            }
            .frame(width: 300, height: 100)
            .border(.black)
            
            Spacer()
        }
       
        
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
