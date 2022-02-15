//
//  appointmentsViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import Foundation
import FirebaseFirestore

class appointmentViewModel: ObservableObject {
    
    @Published var appointment: [Appointment] = []
    //@Published var filteredAppointment: [Appointment] = []
    @Published var profileID: String = ""
    private var pID: String = ""
    @Published var date: Date = Date()
    @Published var profileList: [Profile] = []
    var filteredAppointments: [Appointment] {
        appointment.filter { app in
            app.profileID == profileID
        }
    }
    
    var filteredAppointmentsByDate: [Appointment] {
        appointment.filter { app in
            
            app.appointmentDate == date
            
        }
    }
    
    var allProfilesForAccount: [Appointment] {
        appointment.filter { app in
            
//            profileList.forEach { prof in
//                app.profileID == prof.documentID
//            }
            
            for profile in profileList {
                pID = profile.documentID
            }
            
            return app.profileID == pID
            
        }
    }
    
    
    private var db = Firestore.firestore()
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
//        db.collection("Appointments").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.appointment = documents.map { (queryDocumentSnapshot) -> Appointment in
//                let data = queryDocumentSnapshot.data()
//                let appointmentDate = (data["date"] as? Timestamp )?.dateValue() ?? Date()
//                let name = data["name"] as? String ?? ""
//                let notes = data["notes"] as? String ?? ""
//                let profileID = data["profileID"] as? String ?? ""
//                return Appointment(appointmentDate: .init(timeIntervalSince1970: appointmentDate.timeIntervalSince1970), name: name, notes: notes, profileID: profileID)
//            }
            
        db.collection("Appointments").getDocuments { snapshot, error in
            
            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.appointment = snapshot.documents.map { a in
                            let appointmentDate = (a["date"] as? Timestamp )?.dateValue() ?? Date()
                            let name = a["name"] as? String ?? ""
                            let notes = a["notes"] as? String ?? ""
                            let profileID = a["profileID"] as? String ?? ""
                            let address = a["address"] as? String ?? ""
                            return Appointment(appointmentDate: appointmentDate, address: address, name: name, notes: notes, profileID: profileID)
                        }
                    }
                }
            } else {
                //Handle error
            }
        }

        }
    
    func addData(appointmentDate: Date, name: String, notes: String, address: String, profileID: String) {
        
        db.collection("Appointments").addDocument(data: ["appointmentDate": appointmentDate, "name": name, "notes": notes, "address": address, "profileID": profileID])
       
    }
    
    func getAllAppointments() {
        
    }
    
}

