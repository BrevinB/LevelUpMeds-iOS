//
//  AddAppointmentView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/6/22.
//

import SwiftUI

struct AddAppointmentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var appointmentVM = appointmentViewModel()
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var date: Date = Date()
    @State private var notes: String = "Notes"
    @State var profileID: String
    
    var body: some View {
        VStack() {
            VStack {
                InputTextFieldView(text: $name, placeholder: "Appointment Name", keyboardType: .default, sfSymbol: nil)
                
                InputTextFieldView(text: $address, placeholder: "Address", keyboardType: .default, sfSymbol: nil)
                
                DatePicker("Date", selection: $date)
                    .padding()
                
                TextEditor(text: $notes)
                    .padding()
                    .border(Color("Bright Orange"), width: 2)
                    .foregroundColor(Color.black)
                    .frame(width: 350, height: 250)
                
                ButtonView(title: "Submit") {
                    appointmentVM.addData(appointmentDate: date, name: name, notes: notes, address: address, profileID: profileID)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
                
            
            }
        }
    }
}

struct AddAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAppointmentView(profileID: "")
    }
}
