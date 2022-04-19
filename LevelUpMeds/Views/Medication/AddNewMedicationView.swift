//
//  NewAddMedicationView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/19/22.
//

import SwiftUI


struct AddNewMedicationView: View {
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
    @StateObject private var vm = RegistrationViewModelImpl()
    @StateObject private var medicationVM = medicationViewModel()
    @StateObject private var medicationHistVM = medHistoryViewModel()
    @State private var keyboardHeight: CGFloat = 0
   
    

    
    var body: some View {
        
        ScrollView() {
            Spacer()
            Spacer()
            VStack {
                Spacer()
                InputTextFieldView(text: $medication,
                                   placeholder: "Medication",
                                   keyboardType: .default,
                                   sfSymbol: "pills")
                
                InputTextFieldView(text: $medicationAmount,
                                   placeholder: "2 Pills",
                                   keyboardType: .default,
                                   sfSymbol: "pills")
                
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
                .frame(maxWidth: 350, maxHeight: 60)
                .border(Color("Bright Orange"))
                
                Text("Times of Day")
                DatePicker("Please enter a time", selection: $date, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding()
                
                //TODO: Add options to add additional times
                
                Button(action: {
                    askForReminders.toggle()
                    
                    print(profileID)
                }) {
                    Text("Reminders")
                }
                .alert("Enable Reminders", isPresented: $askForReminders) {
                    Button("Yes") { reminders = true }
                    Button("No") { reminders = false }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Additional Notes")
                        .font(.title2)
                    
                    TextEditor(text: $notes)
                        .padding()
                        .frame(width: 380, height: 250)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("Bright Orange"), lineWidth: 2)
                        )
                        .submitLabel(.done)
                        .onSubmit {
                            self.hideKeyboard()
                        }
                       
                }
                .onTapGesture {
                    self.hideKeyboard()
                  }
               Spacer()
                
            }
            
            
            
            
            Button(action: {
                medicationVM.addData(amount: medicationAmount,
                                     days: ["u":sunday, "m":monday, "t":tuesday, "w":wednesday, "r":thursday, "f":friday, "s":saturday],
                                     name: medication,
                                     notes: notes,
                                     notifications: reminders,
                                     profileID: profileID,
                                     time: date)
                
                let medID = "/Medications/\(medicationVM.medID)"
                let calendar = Calendar.current
                let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())
                let testDict = [[
                    
                    "taken":false,
                    "time":yesterday ?? Date()]]
                
                medicationHistVM.addData(medID: medID, times: testDict)
                
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
               Text("Submit")
            })
            .frame(width: 350, height: 40)
            .background(Color("Bright Orange"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        //.padding(.bottom, keyboardHeight)
        //.ignoresSafeArea(.keyboard, edges: .bottom)
        // 3.
        //.onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }
}

struct NewAddMedicationView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewMedicationView(profileID: "")
    }
}
