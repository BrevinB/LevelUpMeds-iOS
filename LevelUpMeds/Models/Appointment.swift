//
//  Appointments.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import Foundation
import FirebaseFirestore

struct Appointment: Identifiable {
    var id = UUID().uuidString
    var documentID: String
    var appointmentDate: Date
    var address: String
    var name: String
    var notes: String
    var profileID: String
}
