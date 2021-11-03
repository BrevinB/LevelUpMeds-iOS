//
//  BannerImmage.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/22/21.
//

import SwiftUI

struct BannerImmage: View {
    var image: Image
    

    var body: some View {

        image
            .resizable()
            .clipShape(Rectangle())
            .frame(width: 400, height: 100)
            .background(Color("Bright Orange"))
        
    }
}

struct BannerImmage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImmage(image: Image("logo"))
    }
}
