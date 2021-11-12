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
        
            
            VStack() {
                
                BannerImmage(image: Image("logo"))
                
                
                Spacer()
                
                Button(action: {
                    self.personalMedication.toggle()
                }) {
                    Text("Personal \nMedication")
                        .frame(width: 300, height: 220)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .padding()
                        .font(.title)
                }.sheet(isPresented: $personalMedication) {
                    MedicationInfo()
                }
                
                Button(action: {
                    self.patientMedication.toggle()
                }) {
                    Text("Patient \nMedication")
                        .frame(width: 300, height: 220)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .padding()
                        .font(.title)
                }.sheet(isPresented: $patientMedication) {
                    NewUserMedication()
                }
                Spacer()
                Spacer()
                Button(action: skipMedication) {
                    Text("Skip Medication Setup")
                        .padding()
                        .frame(width: 250, height: 30)
                        .background(.gray)
                        .cornerRadius(20)
                }
                
                Spacer()
                Spacer()
                
            }
            .foregroundColor(.black)
            .background(Color("Creamy Blue"))
            .ignoresSafeArea()
    }
        
}

struct MedicationSignUpSelection_Previews: PreviewProvider {
    static var previews: some View {
        MedicationSignUpSelection()
    }
}

func skipMedication() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: CaretakerView())
        window.makeKeyAndVisible()
    }
}
