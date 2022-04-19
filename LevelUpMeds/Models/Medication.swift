//
//  Medication.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/15/22.
//

import Foundation
import Firebase

struct Medication: Identifiable {
    
    var id: String = UUID().uuidString
    var documentID: String
    var amount: String
    var days: [String:Bool]
    var name: String
    var notes: String
    var notificationsEnabled: Bool
    var profileID: String
    var time: Date
//    var reminder: Reminder
    
}

struct Reminder: Codable {
    var timeInterval: TimeInterval?
    var date: Date?
    var repeats = false
}
