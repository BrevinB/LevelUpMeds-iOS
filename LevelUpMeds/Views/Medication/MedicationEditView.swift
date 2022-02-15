//
//  MedicationEditView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/1/21.
//

import SwiftUI

struct MedicationEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var medication = ""
    @State private var medicationAmount = ""
    @State private var notes = "Enter Notes"
    @State private var monday = false
    @State private var tuesday = false
    @State private var wednesday = false
    @State private var thursday = false
    @State private var friday = false
    @State private var saturday = false
    @State private var sunday = false
    @State private var addTime = false
    @State private var date = Date()
    @State private var reminders = false
    @State private var askForReminders = false
    @State var profileID: String
    @FocusState private var fieldIsFocused: Bool
    
    @StateObject private var vm = RegistrationViewModelImpl()
    @StateObject private var medicationVM = medicationViewModel()
    
    var body: some View {
        ZStack() {
            
            VStack(spacing: 15){
                VStack() {
                        //Medicaiotn Field Stack
                        InputTextFieldView(text: $medication, placeholder: "Medication", keyboardType: .default, sfSymbol: "pills")
                            .padding(.bottom, 10)
                        
                        InputTextFieldView(text: $medicationAmount, placeholder: "2 pils", keyboardType: .default, sfSymbol: "pills")
                            .padding(.bottom, 30)
                        
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
                        .frame(width: 350, height: 60)
                        .border(Color("Bright Orange"))
                       
                           
                        
                        Text("Times of Day")
                        DatePicker("Please enter a time", selection: $date, displayedComponents: .hourAndMinute )
                            .labelsHidden()
                            .padding()
                    
                        //TODO: Add option for additional times
//                        Button(action: {
//
//                            print("ADD")
//
//                        }) {
//                            Text("Add Time")
//                        }
                        
                        Button(action: {
                            askForReminders.toggle()
                        }) {
                           Text("Reminders")
                        }
                        .alert("Enable Reminders", isPresented: $askForReminders) {
                                Button("Yes") { reminders = true }
                                Button("No") { reminders = false }
                            }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("ADDITIONAL NOTES")
                                .font(.title2)

                            
                            TextEditor(text: $notes)
                                .padding()
                                .border(Color("Bright Orange"), width: 2)
                                .foregroundColor(Color.black)
                                .frame(width: 350, height: 250)
                                .focused($fieldIsFocused)
                                .submitLabel(.return)
//                                .onSubmit {
//                                    
//                                }
                        }
                                    
                }
                
                ButtonView(title: "Submit") {
                        
//                        let days = [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
                        
                    medicationVM.addData(amount: medicationAmount, days: [sunday, monday, tuesday, wednesday, thursday, friday, saturday], name: medication, notes: notes, notifications: reminders, profileID: profileID, time: date)
                    
                    self.presentationMode.wrappedValue.dismiss()
                    }
            }
            
        }
    }
    
}

struct MedicationEditView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationEditView(profileID: "")
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
                        .padding(12)
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
    
    @State var date = Date()

    var body: some View {
        DatePicker("Please enter a time", selection: $date, displayedComponents: .hourAndMinute )
            .labelsHidden()
    }
}




func addTime(numOfTimes: Int) -> some View {
    
//    for _ in (0...numOfTimes) {
        return displayDate()
//    }
}

