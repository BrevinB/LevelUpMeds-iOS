//
//  RegistrationDetails.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import Foundation

struct RegistrationDetails {
    var email: String
    var password: String
    var confirmedPassword: String
    var firstName: String
    var lastName: String
    var medication: String
    var notes: String
    
}

extension RegistrationDetails {
    
    static var new: RegistrationDetails {
        RegistrationDetails(email: "",
                            password: "",
                            confirmedPassword: "",
                            firstName: "",
                            lastName: "",
                            medication: "",
                            notes: "")
    }
}
