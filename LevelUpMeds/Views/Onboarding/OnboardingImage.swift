//
//  OnboardingImage.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 3/21/22.
//

import SwiftUI

struct OnboardingImage: View {
    var image: String
    
    var body: some View {
        VStack() {
            
            if image == "logo" {
                Image(image)
                    .resizable()
                    .frame(width: 350, height: 100)
            } else {
                Image(image)
                    .resizable()
                    .frame(minWidth: 250.0, maxWidth: 350.0, minHeight: 450, maxHeight: 550)
            }
            
            

                
        }
        
    }
}

struct OnboardingImage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingImage(image: "logo")
    }
}
