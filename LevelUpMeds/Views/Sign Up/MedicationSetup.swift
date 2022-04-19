//
//  MedicationSetup.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/25/22.
//

import SwiftUI

struct MedicationSetup: View {
    
    @State private var personalMedication = false
    @State private var patientMedication = false
    @State private var skipMedicaiton = false
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 32) {
                VStack(spacing: 16) {
//                    ButtonView(title: "Myself") {
//                        //TODO: Add next view
//                        self.personalMedication.toggle()
//                    }.sheet(isPresented: $personalMedication) {
//                        MedicationEditView()
//                    }
                    
                    NavigationLinkButtons(text: "Myself", color: "Bright Orange", view: AnyView(AddNewMedicationView(profileID: "")))
                    
                    ButtonView(title: "Someone Else") {
                        self.patientMedication.toggle()
                    }.sheet(isPresented: $patientMedication) {
                        NewUserMedication()
                    }
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Medication")
            
        }
        
    }
}

struct MedicationSetup_Previews: PreviewProvider {
    static var previews: some View {
        MedicationSetup()
    }
}
