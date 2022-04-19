//
//  NavigationLinkNButton.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/19/21.
//

import Foundation
import SwiftUI

struct NavigationLinkNButton: View {
    var view: AnyView
    var text: String
    var imageName: String
    
    var body: some View {
        NavigationLink(destination: view) {
            HStack {
                Spacer()
                ZStack(alignment: .trailing) {
                    Text(text)
                        .padding(10)
                        .frame(width: 100, alignment: .leading)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .foregroundColor(.black)
                       
                        
                    Image(systemName: imageName)
                        .font(.system(size: 25))
                    
                        
                }
                .font(.title)
            }
        }
        .foregroundColor(.black)
    }
}
