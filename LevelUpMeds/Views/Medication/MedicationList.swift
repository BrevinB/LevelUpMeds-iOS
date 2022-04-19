//
//  MedicationList.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/19/21.
//

import SwiftUI

struct MedicationList: View {
    
    @ObservedObject private var medicationVM = medicationViewModel()
    @ObservedObject private var medicationHist = medHistoryViewModel()
    @State var profileID: String
    private let dateFormatter = DateFormatter()
    @State private var addMedications: Bool = false
    
    init(profileID: String) {
        self.profileID = profileID
        self.medicationVM.profileID = profileID
        medicationVM.fetchData()
    }
    
    var body: some View {
            
            VStack {
                
                VStack {
                    
                    List {
                        ForEach(medicationVM.filteredMedications) { med in
                            MedicationCardView(medication: med, showAdditional: false, currDate: Date())
                        }
                        .onDelete(perform: removeMedications)
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
                        AddNewMedicationView(profileID: profileID)
                })
                }
                
                
                
                
            }
            

       
       
    }
    
    func removeMedications(at offsets: IndexSet) {
       
        for item in offsets.makeIterator() {
            let med = medicationVM.filteredMedications[item]
            let hist = medicationHist.getMedHistory(med: med)
            
            medicationVM.deleteMedication(medication: med, medHist: hist)
        }
        
        medicationVM.fetchData()
       
        
    }
}

struct MedicationList_Previews: PreviewProvider {
    static var previews: some View {
        MedicationList(profileID: "/Profiles/k2f4OJeJS8JUs0kShO3O")
    }
}

