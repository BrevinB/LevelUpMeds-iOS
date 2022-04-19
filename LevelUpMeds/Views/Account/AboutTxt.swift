//
//  AboutTxt.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 4/5/22.
//

import SwiftUI

struct AboutTxt: View {
    var body: some View {
        ScrollView() {
            VStack(spacing: 5) {
                VStack {
                    Text("LevelUp Meds is designed for the person or persons taking care of one or more loved ones or other people needing care. The app centers around communication, organization, and medication management.")
                }.padding()
                
                VStack {
                    Text("The very first version of this app is currently being developed by a team of seniors at Purdue Fort Wayne (PFW) working on their Senior Capstone Project. It is being developed for both Apple Products (iOS - iPhones) and Android Products.")
                }.padding()
                
                VStack {
                    Text("The students need your input. It is very valuable to them! Email us at info@levelup-meds.com and tell us of any bugs. (Hint: this email goes directly to the CEO and the students!)  We welcome screen captures if you can. Because of time and resource constraints not all features will be available in this version. Be sure to tell us what features you would like to see in the app!")
                }.padding()
                
                VStack {
                    Text("NOTE: Using the app means you have read and agree to the LevelUp Meds termsand conditions and understand the Beta Tester agreement.")
                    Link("Terms of Service", destination: URL(string: "https://levelup-meds.com/#39d6e247-bdfe-49d8-af55-aaae245817e2")!)
                }.padding()

            }
        }
            
    }
}

struct AboutTxt_Previews: PreviewProvider {
    static var previews: some View {
        AboutTxt()
    }
}
