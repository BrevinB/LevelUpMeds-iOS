//
//  RegistrationService.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import Foundation
import Combine
import Firebase
import FirebaseDatabase

enum RegistrationKeys: String {
    case firstName
    case lastName
    case email
}

protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email, password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            
                            if let uid = res?.user.uid {
                                
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName,
                                              RegistrationKeys.email.rawValue: details.email]
                                
                                Database.database()
                                    .reference()
                                    .child("Accounts")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                        
                                    }
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                            
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
}
