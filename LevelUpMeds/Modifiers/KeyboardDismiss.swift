//
//  KeyboardDismiss.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 3/17/22.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
