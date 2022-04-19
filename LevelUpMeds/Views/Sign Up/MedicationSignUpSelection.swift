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
        
            
        ZStack {
            
            BackgroundColor(color: "Creamy Blue")
            
            VStack() {
                    
                    BannerImmage(image: Image("logo"))
                    
                    
                    Spacer()
                    
                    
                    Text("Who Are You Entering Medication For?")
                    .font(.title)
                    .padding(.bottom, 50)
                
                    Button(action: {
                        self.personalMedication.toggle()
                    }) {
                        Text("Myself")
                            .frame(width: 300, height: 100)
                            .background(Color("Bright Orange"))
                            .cornerRadius(20)
                            .padding()
                            .font(.title)
                    }.sheet(isPresented: $personalMedication) {
                        //TODO: ADD
                    }
                    
                    Button(action: {
                        self.patientMedication.toggle()
                    }) {
                        Text("Someone Else")
                            .frame(width: 300, height: 100)
                            .background(Color("Bright Orange"))
                            .cornerRadius(20)
                            .padding()
                            .font(.title)
                    }.sheet(isPresented: $patientMedication) {
                        NewUserMedication()
                    }
                    Spacer()
                    Spacer()
                    Button(action: {
                    //TODO: Add action
                    }) {
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
            .ignoresSafeArea()
        }
    }
        
}

struct MedicationSignUpSelection_Previews: PreviewProvider {
    static var previews: some View {
        MedicationSignUpSelection()
    }
}

