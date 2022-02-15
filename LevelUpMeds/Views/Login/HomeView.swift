//
//  SwiftUIView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 16) {
                Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Email: \(sessionService.userDetails?.email ?? "N/A")")
                Text("Logged In as \(Auth.auth().currentUser?.email ?? "")")
            }
            
            ButtonView(title: "Logout") {
                sessionService.logout()
            }
            
            
        }
        .padding(.horizontal, 16)
        .navigationTitle("Main ContentView")
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
