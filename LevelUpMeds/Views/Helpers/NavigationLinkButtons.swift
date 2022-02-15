//
//  NavigationLinkButtons.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/12/21.
//

import Foundation
import SwiftUI

struct NavigationLinkButtons: View {
    var text: String
    var color: String
    var view: AnyView
    var body: some View {
        
        NavigationLink(destination: view) {
                Text(text)
                    .padding()
                    .frame(width: 250, height: 60)
                    .background(Color(color))
                    .cornerRadius(20)

                    .font(.title)
                   }
        
    }
}
