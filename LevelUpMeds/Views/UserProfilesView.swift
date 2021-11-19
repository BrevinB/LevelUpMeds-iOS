//
//  PatientMenuView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/28/21.
//

import SwiftUI

struct UserProfilesView: View {
    var body: some View {
        NavigationView() {
            ZStack {
                BackgroundColor(color: "Creamy Blue")
            
                VStack {
                 
                    List {
                        NavigationLink(destination: IndividualProfileView()) {
                            UserProfile(name: "Alex",
                                        imageName: "a.circle.fill")
                        }
                        
                        NavigationLink(destination: IndividualProfileView()) {
                            UserProfile(name: "John",
                                        imageName: "j.circle.fill")
                        }
                        
                        NavigationLink(destination: IndividualProfileView()) {
                            UserProfile(name: "Stacey",
                                        imageName: "s.circle.fill")
                        }
                        
                        NavigationLink(destination: IndividualProfileView()) {
                            UserProfile(name: "Megan",
                                        imageName: "m.circle.fill")
                        }
                        
                        NavigationLink(destination: IndividualProfileView()) {
                            UserProfile(name: "Kelsey",
                                        imageName: "k.circle.fill")
                        }
                    }
                    
                    Button(action: {
                        print("ADD")
                    }) {
                        Text("Add User")
                            .foregroundColor(.black)
                            .frame(width: 200, height: 50)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color("Bright Orange"))
                    .padding()
                    
                    Spacer()
                    Spacer()
                }
            }
            
        }
    }
}

struct PatientMenuView_Previews: PreviewProvider {
    static var previews: some View {
        
            UserProfilesView()
        
    }
}


