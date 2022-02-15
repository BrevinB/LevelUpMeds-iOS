//
//  LoginCredentials.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/24/22.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}
