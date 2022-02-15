//
//  MedicationList.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/19/21.
//

import SwiftUI

struct MedicationList: View {
    
    @ObservedObject private var medicationVM = medicationViewModel()
    @State var profileID: String = ""
    private let dateFormatter = DateFormatter()
    @State private var addMedications: Bool = false
    
    init(profileID: String) {
        self.profileID = profileID
        self.medicationVM.profileID = profileID
    }
    
    var body: some View {
    

            
            VStack {
                
                VStack {
                    List(medicationVM.filteredMedications) { med in
                        MedicationCardView(time: dateFormatter.string(from: med.time), medication: med.name)
                    }
                }
                
    
                VStack {
                    ButtonView(title: "Add Medications") {
                        addMedications.toggle()
                    }
                    .frame(width: 350, height: 50)
                    .sheet(isPresented: $addMedications, onDismiss: {
                        medicationVM.fetchData()
                    }, content: {
                        MedicationEditView(profileID: profileID)
                })
                }
                
                
                
                
            }

       
       
    }
}

struct MedicationList_Previews: PreviewProvider {
    static var previews: some View {
        MedicationList(profileID: "")
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
                NavigationLink(destination: MedicationEditView(profileID: ""), label: {
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
