//
//  medicationViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/20/22.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class medicationViewModel: ObservableObject {
    
    
    
    @Published
     var medication: [Medication] = []
     var profileID: String = ""
     var medID: String = ""
     var allMedications: [Medication] = []
    
    var filteredMedications: [Medication] {
        medication.filter { med in
            med.profileID == profileID 
        }
    }
    
    
    
    init() {
        //self.fetchData()
    }
    
    private var db = Firestore.firestore()
    
    
    
    func fetchData() {
            
        db.collection("Medications").getDocuments { snapshot, error in
            
            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.medication = snapshot.documents.map { med in
                            let documentID = med.documentID
                            let amount = med["amount"] as? String ?? ""
                            let days = med["days"] as? [String:Bool] ?? ["f":false, "m":false, "t":false, "w":false, "r":false, "u":false, "s":false]
                            let name = med["name"] as? String ?? ""
                            let notes = med["notes"] as? String ?? ""
                            let notifications = med["notifications"] as? Bool ?? false
                            let profileID = med["profileID"] as? String ?? ""
                            let time = (med["time"] as? Timestamp )?.dateValue() ?? Date()
                            return Medication(documentID: documentID,
                                              amount: amount,
                                              days: days,
                                              name: name,
                                              notes: notes,
                                              notificationsEnabled: notifications,
                                              profileID: profileID,
                                              time: time)
                        }
                    }
                }
            } else {
                //Handle error
            }
        }

        
    }
    
    func addData(amount: String, days: [String:Bool], name: String, notes: String, notifications: Bool, profileID: String, time: Date) {
        
        let ref = db.collection("Medications").document()
        medID = ref.documentID
        
        ref.setData(["amount": amount,
                     "days": days,
                     "name": name,
                     "notes": notes,
                     "notifications": notifications,
                     "profileID": profileID,
                     "time": time])
        
        
    }
    
    func updateData(amount: String, days: [String:Bool], name: String, notes: String, notifications: Bool, time: Date, documentID: String) {

        db.collection("Medications").document(documentID).updateData(["amount": amount,
                                                               "days": days,
                                                               "name": name,
                                                               "notes": notes,
                                                               "notifications": notifications,
                                                               "time": time])
    }
    
    
    //This gets all medications for all profiles associated to an account
    func getAllMedications(profileID: String) {
     
        
        for med in medication {
            if med.profileID == "/Profiles/\(profileID)" {
                allMedications.append(med)
            }
        }
    }
    
    func deleteMedication(medication: Medication, medHist: MedicationHistory) {
        
        
        db.collection("MedHistories").document(medHist.documentID).delete() { err in

            if let err = err {
                print(err)
            } else {
                print("medHistory removed")
            }
        }

        db.collection("Medications").document(medication.documentID).delete() { err in

            if let err = err {
                print("error removing data \(err)")
            } else {
                print("med removed")
            }

        }
        
     
    }
    
}
