//
//  MedicationInfo.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import SwiftUI

struct MedicationInfo: View {
    
    @State private var medication = ""
    var body: some View {
        NavigationView() {
    
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                VStack() {
                    //Medicaiotn Field Stack
                    HStack (alignment: .center, spacing: 10) {
                        Image(systemName: "pills")
                        TextField ("Medication Name", text: $medication)
                            .frame(height: 60)
                    }
                    .padding([.top,.bottom], 2)
                    .padding(.leading, 5)
                    .background(Color.white, alignment: .center)
                    .cornerRadius(10)
                    .frame(width: 300)
                    .padding(50)
                    
                    Text("Days Taken Per Week:")
                    HStack() {
                        Text("S")
                        Text("M")
                        Text("T")
                        Text("W")
                        Text("T")
                        Text("F")
                        Text("S")
                    }
                    Text("Times Taken Per Day")
                }
            }
            
        }
    }
}

struct MedicationInfo_Previews: PreviewProvider {
    static var previews: some View {
        MedicationInfo()
    }
}
