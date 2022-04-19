//
//  appointmentsViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import Foundation
import FirebaseFirestore
import CoreLocation
import SwiftUI

class appointmentViewModel: ObservableObject {
    
    @ObservedObject private var userViewModel = profileViewModel()
    
    @Published var appointment: [Appointment] = []
    @Published var filteredAppointment: [Appointment] = []
    @Published var profileID: String = ""
    @Published var allAppointments: [Appointment] = []
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
    
    private var db = Firestore.firestore()
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
            
        db.collection("Appointments").getDocuments { snapshot, error in
            
            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.appointment = snapshot.documents.map { a in
                            let documentID = a.documentID
                            let appointmentDate = (a["appointmentDate"] as? Timestamp )?.dateValue() ?? Date()
                            let name = a["name"] as? String ?? ""
                            let notes = a["notes"] as? String ?? ""
                            let profileID = a["profileID"] as? String ?? ""
                            let address = a["address"] as? String ?? ""
                            return Appointment(documentID: documentID, appointmentDate: appointmentDate, address: address, name: name, notes: notes, profileID: profileID)
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
    
    func getLocation(appointment: Appointment, completion: @escaping (_ location: CLLocationCoordinate2D?) -> Void) {

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(appointment.address) { (placemarks, error) in
            
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else {
                      completion(nil)
                      return
                  }
            completion(location)
            
        }
        
        
        
    }
    
    func updateData(date: Date, name: String, notes: String, address: String, documentID: String) {
        
        
        db.collection("Appointments").document(documentID).updateData(["appointmentDate": date,
                                                               "name": name,
                                                               "notes": notes,
                                                               "address": address])
    }
    
    //This gets all appointments for all profiles associated to an account
    func getAllAppointments(profileID: String) {
     
        
        for app in appointment {
            
            if app.profileID == "/Profiles/\(profileID)" {
                allAppointments.append(app)
            }
        }
    }
    
    func deleteAppointment(app: Appointment) {
        
        
        db.collection("Appointments").document(app.documentID).delete() { err in

            if let err = err {
                print(err)
            } else {
                print("Appointment removed")
            }
        }
     
    }

    
}

