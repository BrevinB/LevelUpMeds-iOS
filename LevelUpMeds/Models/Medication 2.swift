//
//  Medication.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/20/22.
//

import Foundation

struct Medication: Identifiable, Codable {
    var id = UUID().uuidString
    var amount: String
    var days: [Bool]
    var name: String
    var notes: String
    var notifications: Bool
    var profileID: String
    var time: Date
}
