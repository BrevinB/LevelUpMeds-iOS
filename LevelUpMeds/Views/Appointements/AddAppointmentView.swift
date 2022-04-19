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
        ScrollView {
          Spacer()
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
                    appointmentVM.addData(appointmentDate: date, name: name, notes: notes, address: address, profileID: profileID)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 350, height: 40)
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
