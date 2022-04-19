//
//  MedicationCardsView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/15/22.
//

import SwiftUI

struct MedicationCardsView: View {
    var time: String
    var medication: String
    var name: String =  "Name"

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 80)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                let initial = Array(name)[0]
                nameTagView(symbolName: "\(initial.lowercased()).circle.fill",
                            name: name,
                            time: time)
                HStack {
                    VStack {
                        Image(systemName: "pills.fill")
                            .padding([.trailing], 40)
                    }
                    
                    VStack {
                        Text("Name:")
                        Text("Dosage:")
                    }
                    
                    VStack {
                        Text(medication)
                        Text("1 pill")
                        
                    }
                    
                }
            }
            
        }
        .padding()
        }
    }


struct MedicationCardsView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationCardsView(time: "test", medication: "test")
    }
}
