//
//  PreviewLayoutComponentModifier.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/22/22.
//

import Foundation
import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    
    let name: String
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
            .padding()
    }
    
}

extension View {
    
    func preview(with name: String) -> some View {
        self.modifier(PreviewLayoutComponentModifier(name: name))
    }
}
