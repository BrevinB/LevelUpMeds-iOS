//
//  CalendarView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    private var medication: String = "Medication"
    private var appointement: String = "Appointement"
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
                           Text(" 06  ")
                           Text(" 07  ")
                           Text(" 08  ")
                           ZStack {
                              Circle()
                                   .stroke(Color("Bright Orange"), lineWidth: 4)
                               Text(" 09  ")
                           }
                           .frame(width: 30, height: 30)
                           Text(" 10  ")
                           Text(" 11  ")
                           Text(" 12  ")
                          
                       }
                      
                       
                   }
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(Color("Calm Grey"))
                   
                   ScrollView {
                   
                   HStack() {
                       DatePicker("Please enter a time", selection: $date, displayedComponents: .date )
                           .labelsHidden()
                   }
                   
                   Spacer()
                   
                       CalendarCardView(type: medication, time: "2:30 PM",
                                        medication: "Benadryl")
                       CalendarCardView(type: medication, time: "3:30 PM",
                                        medication: "Creatine")
                       CalendarCardView(type: medication, time: "5:00 PM",
                                        medication: "Effexor")
                       
                       CalendarCardView(type: appointement, time: "2:30 PM",
                                        medication: "")
                   

                  
                   
                   Spacer()
               }
           }
       }
        
       
        
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


struct CalendarCardView: View {

    var type: String
    var time: String
    var medication: String
    var body: some View {
    
        if type == "Medication" {
            
            MedicationCardsView(time: time, medication: medication)
        }
        
        if type == "Appointement" {
            
        }
        }
    }

struct nameTagView: View {
    
    var symbolName: String
    var name: String
    var time: String
    
    var body: some View {
        HStack() {
            Image(systemName: symbolName)
                .padding()
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            Text(time)
                .padding()
                .font(.headline)
        }
        .frame(width: 350, height: 30)
        .background(Color("Dark Grey"))
        .foregroundColor(.white)
    }
}

