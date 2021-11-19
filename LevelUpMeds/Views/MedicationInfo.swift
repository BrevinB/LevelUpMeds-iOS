//
//  MedicationInfo.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import SwiftUI

struct MedicationInfo: View {
    
    @State private var medication = ""
    @State private var monday = false
    @State private var tuesday = false
    @State private var wednesday = false
    @State private var thursday = false
    @State private var friday = false
    @State private var saturday = false
    @State private var sunday = false
    @State private var addTime = false
    @State private var date = Date()
    
    var body: some View {
        NavigationView() {
    
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                VStack() {
                    //Medicaiotn Field Stack
                    HStack (alignment: .center, spacing: 10) {
                        Image(systemName: "pills")
                        TextField ("Medication Name", text: $medication)
                            .frame(height: 60)
                    }
                    .padding([.top,.bottom], 2)
                    .padding(.leading, 5)
                    .background(Color.white, alignment: .center)
                    .cornerRadius(10)
                    .frame(width: 300)
                    .padding(50)
                    
                    Text("Days Taken Per Week:")
                        
                    HStack(spacing: 10) {
                            
                            DayOfWeek(day: "S", isSelected: $sunday)
                            DayOfWeek(day: "M", isSelected: $monday)
                            DayOfWeek(day: "T", isSelected: $tuesday)
                            DayOfWeek(day: "W", isSelected: $wednesday)
                            DayOfWeek(day: "T", isSelected: $thursday)
                            DayOfWeek(day: "F", isSelected: $friday)
                            DayOfWeek(day: "S", isSelected: $saturday)
                            
                        }
                       
                    
                    Text("Times of Day")
                    displayDate()
                
                    
                    Button(action: {
                        
                        print("ADD")
                        
                    }) {
                        Text("Add Time")
                    }
                    
                    Button(action: {
                        print("Reminders")
                    }) {
                       Text("Reminders")
                    }
                    .padding()
                    
                    
                    VStack(alignment: .leading) {
                        Text("ADDITIONAL NOTES")
                            .font(.title2)
                        
                        TextField ("Aditional Notes", text: $medication)
                            .frame(height: 60)
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(10)
                            .frame(width: 300)
                            .padding([.bottom], 50)
                    }
                    
                    
                    
                    NavigationLinkNButton(view: AnyView(MedicationList()), text: "Next", imageName: "arrow.right")
                    
                    
                }
            }
            
        }
    }
}

struct MedicationInfo_Previews: PreviewProvider {
    static var previews: some View {
        MedicationInfo()
    }
}

struct DayOfWeek: View {
    var day: String
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            
            if isSelected {
                
                daySelected()
                
            }
            
                Button(action: {
                    isSelected.toggle()
                    
                }) {
                    
                    Text(day)
                        .padding(1)
                        .foregroundColor(.black)
                }
                
        }
    }
    
}

struct daySelected: View {
    var body: some View {
        Circle()
            .fill(.orange)
            .frame(width: 40, height: 40)
    }
}

struct displayDate: View {
    
    @State private var date = Date()

    var body: some View {
        DatePicker("Please enter a time", selection: $date, displayedComponents: .hourAndMinute )
            .labelsHidden()
    }
}


