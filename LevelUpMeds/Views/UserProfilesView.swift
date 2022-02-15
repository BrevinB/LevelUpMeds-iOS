//
//  PatientMenuView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/28/21.
//

import SwiftUI
import Firebase

struct UserProfilesView: View {

    @ObservedObject private var viewModel = profileViewModel()
    @State private var isAddingProfile = false

   
    
    init() {
        viewModel.fetchData()
    }

    var body: some View {
        NavigationView() {
            ZStack {
            
                VStack {
                    
                    if viewModel.filteredProfiles.isEmpty {
                        Text("Please add a profile")
                    }
                    
                    List(viewModel.filteredProfiles) { profile in

                        NavigationLink(destination: IndividualProfileView(profileID: profile.documentID, name: profile.fname)) {
                            UserProfile(name: profile.fname, imageName: "\(profile.initial).circle.fill")

                        }

                    }
                    
                    ButtonView(title: "Add User") {
                      
                        isAddingProfile.toggle()
                        
                    }
                    .sheet(isPresented: $isAddingProfile, onDismiss: {
                        viewModel.fetchData()
                    },
                    content: {
                        AddProfileView()
                    })
                    
                    
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


