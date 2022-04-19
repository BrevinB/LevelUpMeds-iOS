//
//  BackgroundColor.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/12/21.
//

import Foundation
import SwiftUI

struct BackgroundColor : View {
    var color: String
    var body: some View {
        
        Color(color)
            .ignoresSafeArea()
    }
}
