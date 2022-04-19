//
//  AppointmentEditView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/21/22.
//

import SwiftUI

struct AppointmentEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var appointmentVM = appointmentViewModel()
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var date: Date = Date()
    @State private var notes: String = "Notes"
    @State private var profileID: String = ""
    var appointment: Appointment
    
    init(appointment: Appointment) {
        
        self.appointment = appointment
        
    }
    
    var body: some View {
        ScrollView {
            VStack {
                InputTextFieldView(text: $name, placeholder: "Appointment Name", keyboardType: .default, sfSymbol: nil)
                
                InputTextFieldView(text: $address, placeholder: "Address", keyboardType: .default, sfSymbol: nil)
                
                DatePicker("Date", selection: $date)
                    .padding()
                
                TextEditor(text: $notes)
                    .padding()
                    .frame(width: 380, height: 250)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color("Bright Orange"), lineWidth: 2)
                    )
                
                ButtonView(title: "Submit") {
                    appointmentVM.updateData(date: date, name: name, notes: notes, address: address, documentID: appointment.documentID)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 350, height: 40)
                .padding()
                
                
            
            }
            .onTapGesture {
                self.hideKeyboard()
              }
        }
        .onAppear {
            self.setData()
        }
    }
    
    private func setData() {
        name = appointment.name
        address = appointment.address
        date = appointment.appointmentDate
        notes = appointment.notes
        profileID = appointment.profileID
    }
    
}

struct AppointmentEditView_Previews: PreviewProvider {
    static var previews: some View {
        
        let appointment: Appointment = Appointment(documentID: "",
                                                   appointmentDate: Date(),
                                                      address: "1234 App Dr",
                                                      name: "Covid Test",
                                                      notes: "Testing for da cove",
                                                      profileID: "")
        
        AppointmentEditView(appointment: appointment)
            .previewInterfaceOrientation(.portrait)
    }
}


