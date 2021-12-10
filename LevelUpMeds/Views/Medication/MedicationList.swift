//
//  MedicationList.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/19/21.
//

import SwiftUI

struct MedicationList: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                
                VStack {
                    
                    MedicationListCardView(medication: "Benadryl")
                    
                    MedicationListCardView(medication: "Creatine")
                    
                    MedicationListCardView(medication: "Effexor")
                    
                    MedicationListCardView(medication: "Vitamin D")
                    Spacer()
                    
                    
                    
                    NavigationLink(destination: MedicationInfo(), label: {
                        Text("Manage Medications")
                            .frame(width: 250, height: 50)
                            .background(Color("Bright Orange"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding()
                    })
                    
                    
                    
                    
                }
                
                
                
            }
        }
       
    }
}

struct MedicationList_Previews: PreviewProvider {
    static var previews: some View {
        MedicationList()
    }
}

struct MedicationListCardView: View {
    var medication: String
    var body: some View {
        
       
        ZStack {
            HStack {
                MedicationCardView(time: "", medication: medication)
                
                
            }
            
            HStack {
                Spacer()
                NavigationLink(destination: MedicationEditView(), label: {
                    Text("Edit")
                })
                    .frame(width: 50, height: 30)
                    .background(Color("Bright Orange"))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.trailing, 30)
                    .padding(.top, 50)
            }
        }
       
        
            
        
        
        
    }
}
