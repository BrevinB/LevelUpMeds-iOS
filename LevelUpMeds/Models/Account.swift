//
//  User.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import Foundation

struct Account: Identifiable {
    
    var id: String = UUID().uuidString
    var email: String
    var fname: String
    var lname: String
    var password: String
    
}
