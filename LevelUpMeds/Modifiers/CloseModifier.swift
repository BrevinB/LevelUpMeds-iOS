//
//  CloseModifier.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import Foundation
import SwiftUI

struct CloseModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
    }
    
}
    
extension View {
    
    func applyClose() -> some View {
        self.modifier(CloseModifier())
    }
}
