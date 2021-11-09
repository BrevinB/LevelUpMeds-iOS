//
//  MedicationSignUpSelection.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import SwiftUI

struct MedicationSignUpSelection: View {
    
    @State private var personalMedication = false
    @State private var patientMedication = false
    @State private var skipMedicaiton = false
    
    var body: some View {
        NavigationView() {
            VStack() {
                
                VStack {
                    Text(" ")
                }
                .frame(maxWidth: .infinity)
                .background(Color("Dark Grey"))
                
                
                Spacer()
                
                Button(action: {
                    self.personalMedication.toggle()
                }) {
                    Text("Personal Medication")
                }.sheet(isPresented: $personalMedication) {
                    MedicationInfo()
                }
                
                Spacer()
                Spacer()
                
            }
        }
    }
}

struct MedicationSignUpSelection_Previews: PreviewProvider {
    static var previews: some View {
        MedicationSignUpSelection()
    }
}
