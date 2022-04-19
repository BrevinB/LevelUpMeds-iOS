//
//  Notes.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 4/5/22.
//

import Foundation

struct Notes: Identifiable {
    
    var id = UUID().uuidString
    let documentID: String
    let title: String
    let note: String
    let profileID: String
    let time: Date
    
}
