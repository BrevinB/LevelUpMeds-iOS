//
//  AccountBannerImg.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 4/5/22.
//

import SwiftUI

struct AccountBannerImg: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 400, height: 120)
    }
}

struct AccountBannerImg_Previews: PreviewProvider {
    static var previews: some View {
        AccountBannerImg()
    }
}
