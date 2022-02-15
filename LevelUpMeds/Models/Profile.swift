//
//  Profiels.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/28/22.
//

import Foundation

struct Profile: Identifiable {
    
    var id: String = UUID().uuidString
    var documentID: String
    var fname: String
    var lname: String
    var initial: String
    var uid: String
    
}
