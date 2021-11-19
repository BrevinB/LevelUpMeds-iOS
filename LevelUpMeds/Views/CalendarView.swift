//
//  CalendarView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    
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
                
                
                
                HStack() {
                    DatePicker("Please enter a time", selection: $date, displayedComponents: .date )
                        .labelsHidden()
                }
                
                Spacer()
                
                cardView(appointement: "Doctors Appointement", time: "5:00PM - 7:00 PM")
                
                cardView(appointement: "Medicine 1", time: "5:00 PM")
                
                cardView(appointement: "Medicine 2", time: "8:00 PM")
        
                

               
                
                Spacer()
            }
        }
        
       
        
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


struct cardView: View {
    var appointement: String
    var time: String
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("Bright Orange"), Color("Croci Yellow")]),
                                     startPoint: .top,
                                     endPoint: .bottomTrailing))
                .frame(width: 350, height: 150)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                Text(appointement)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(time)
                    .font(.title2)
            }
        }
        .padding()
        }
    }

