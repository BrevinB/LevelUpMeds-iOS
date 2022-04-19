//
//  MedicationEditView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/1/21.
//

import SwiftUI

struct MedicationEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var medicationName = ""
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
    @StateObject private var vm = RegistrationViewModelImpl()
    @StateObject private var medicationVM = medicationViewModel()
    var medication: Medication
    
    init(medication: Medication) {
        self.medication = medication
        
    }
    

    
    var body: some View {

        ScrollView() {
            Spacer()
            Spacer()
            VStack(spacing: 15){
                VStack() {
                        //Medicaiotn Field Stack
                        InputTextFieldView(text: $medicationName, placeholder: "Medication", keyboardType: .default, sfSymbol: "pills")
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

                        
                        Button(action: {
                            askForReminders.toggle()
                        }) {
                           Text("Reminders")
                        }
                        .alert("Enable Reminders", isPresented: $askForReminders) {
                                Button("Yes") { reminders = true }
                                Button("No") { reminders = false }
                            }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("ADDITIONAL NOTES")
                                .font(.title2)

                            
                            TextEditor(text: $notes)
                                .frame(width: 380, height: 250)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color("Bright Orange"), lineWidth: 2)
                                )
                                .submitLabel(.return)
                                .foregroundColor(.black)
                                
                        }
                        .onTapGesture {
                            self.hideKeyboard()
                          }
                                    
                }
                
                ButtonView(title: "Submit") {
                      //TODO: Update Medication
                    medicationVM.updateData(amount: medicationAmount,
                                            days: ["u":sunday, "m":monday, "t":tuesday, "w":wednesday, "r":thursday, "f":friday, "s":saturday],
                                            name: medicationName,
                                            notes: notes,
                                            notifications: reminders,
                                            time: date,
                                            documentID: medication.documentID)
                    self.presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 350, height: 40)
                    .padding()
            }
        }
            .onAppear {
                setData()
            }

            
        }
    
    private func setData() {
        medicationName = medication.name
        medicationAmount = medication.amount
        date = medication.time
        reminders = medication.notificationsEnabled
        notes = medication.notes
        
        sunday = medication.days["u"]!
        monday = medication.days["m"]!
        tuesday = medication.days["t"]!
        wednesday = medication.days["w"]!
        thursday = medication.days["r"]!
        friday = medication.days["f"]!
        saturday = medication.days["s"]!
        
    }
    

    
}

struct MedicationEditView_Previews: PreviewProvider {
    static var previews: some View {
        
        let testMedication = Medication(documentID: "", amount: "6 pills",
                                        days: ["f":true, "m":true, "t":false, "w":true, "r":false, "u":false, "s":false],
                                        name: "Creatine",
                                        notes: "Take 6 a day",
                                        notificationsEnabled: true,
                                        profileID: "/Profiles/k2f4OJeJS8JUs0kShO3O", time: Date())
        
        MedicationEditView(medication: testMedication)
           
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





