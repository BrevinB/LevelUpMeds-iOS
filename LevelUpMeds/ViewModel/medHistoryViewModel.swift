//
//  medHistoryViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/24/22.
//

import Foundation
import FirebaseFirestore

class medHistoryViewModel: ObservableObject {
    
    @Published var medHistory: [MedicationHistory] = []
    @Published var profileID: String = ""
    
    init() {
        self.fetchData()
    }
    
    private var db = Firestore.firestore()
    
    func fetchData() {
            
        db.collection("MedHistories").getDocuments { snapshot, error in
            
            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.medHistory = snapshot.documents.map { hist in
                            let documentID = hist.documentID
                            let medID = hist["medID"] as? String ?? ""
                            let times = hist["times"] as? [[String:Any]] ?? [["taken":false, "time":Date()]]
                            return MedicationHistory(documentID: documentID, medID: medID, times: times)
                        }
                    }
                }
            } else {
                //Handle error
            }
        }

        
    }
    
    
    func addData(medID: String, times: [[String:Any]]) {
        
        db.collection("MedHistories").addDocument(data: ["medID": medID, "times": times])
        
      
    }
    
    func updateData(med: MedicationHistory, time: Date, value: Bool) {
        
        var newTimes = med.times
        newTimes.append(["taken": value, "time":time])
        
        db.collection("MedHistories").document(med.documentID).updateData(["times": newTimes])
    }
    
    func getMedHistory(med: Medication) -> MedicationHistory {
        
        var hist: MedicationHistory = MedicationHistory(documentID: "", medID: "", times: [["":""]])
        for medHist in medHistory {
        
            if medHist.medID == "/Medications/\(med.documentID)" {
                hist = medHist
                break
            }
            
        }
        
        return hist
    }
    
    func takeMed(medication: Medication, date: Date) {
       
        print("THis is called")
        
        let history = self.getMedHistory(med: medication)
    
        print(history)
        self.updateData(med: history, time: date, value: true)
        
    }
    
    func skipMed(medication: Medication, date: Date) {
        let history = self.getMedHistory(med: medication)
        
        self.updateData(med: history, time: date, value: false)
    }
    
    
    
}
