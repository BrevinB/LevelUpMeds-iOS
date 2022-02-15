//
//  AccountView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/19/21.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    let email = Auth.auth().currentUser?.email ?? "email@gmail.com"
    
    var body: some View {
        
        VStack {
            
            Text(email)
            
            ButtonView(title: "Logout") {
                sessionService.logout()
            }
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
