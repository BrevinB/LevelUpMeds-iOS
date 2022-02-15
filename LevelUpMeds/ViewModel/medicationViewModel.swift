//
//  medicationViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/20/22.
//

import Foundation
import FirebaseFirestore

class medicationViewModel: ObservableObject {
    
    
    @Published var medication: [Medication] = []
    @Published var profileID: String = ""
    var filteredMedications: [Medication] {
        medication.filter { med in
            med.profileID == profileID 
        }
    }
    
    init() {
        self.fetchData()
    }
    
    private var db = Firestore.firestore()
    
    func fetchData() {
            
        db.collection("Medications").getDocuments { snapshot, error in
            
            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.medication = snapshot.documents.map { med in
                            let id = med.documentID
                            let amount = med["amount"] as? String ?? ""
                            let days = med["days"] as? [Bool] ?? [false]
                            let name = med["name"] as? String ?? ""
                            let notes = med["notes"] as? String ?? ""
                            let notifications = med["notifications"] as? Bool ?? false
                            let profileID = med["profileID"] as? String ?? ""
                            let time = (med["time"] as? Timestamp )?.dateValue() ?? Date()
                            return Medication(id: id,
                                              amount: amount,
                                              days: days,
                                              name: name,
                                              notes: notes,
                                              notifications: notifications,
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
    
    func addData(amount: String, days: [Bool], name: String, notes: String, notifications: Bool, profileID: String, time: Date) {
        
            db.collection("Medications").addDocument(data: ["amount": amount,
                                                            "days": days,
                                                            "name": name,
                                                            "notes": notes,
                                                            "notifications": notifications,
                                                            "profileID": profileID,
                                                            "time": time])
        
      
    }
    
}
