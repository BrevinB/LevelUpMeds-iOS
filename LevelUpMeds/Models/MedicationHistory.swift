//
//  MedicationHistory.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/24/22.
//

import Foundation
import Firebase

struct MedicationHistory: Identifiable {
    
    var id: String = UUID().uuidString
    let documentID: String
    var medID: String
    var times: [[String: Any]]
}
