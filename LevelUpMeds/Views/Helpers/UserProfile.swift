//
//  UserProfile.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/18/21.
//

import Foundation
import SwiftUI

struct UserProfile: View {
    var name: String
    var imageName: String
    
    var body: some View {
        HStack {
            
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Text(name)
                .font(.title)
            Spacer()
            
        }
    }
}
