//
//  SwitchViews.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import Foundation
import SwiftUI

func viewSwitch() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: MedicationSignUpSelection())
        window.makeKeyAndVisible()
    }
}
