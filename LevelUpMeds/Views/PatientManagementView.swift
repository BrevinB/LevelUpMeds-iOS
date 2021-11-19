//
//  PatientManagement.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/28/21.
//

import SwiftUI

struct PatientManagementView: View {
    var body: some View {
        NavigationView {
            VStack {
                

            Group {
                NavigationLink(destination: UserProfilesView()) {
                    
                    Text("Kayla")
                    
                }
                .padding()
                
                
                NavigationLink(destination: UserProfilesView()) {
                    Text("Abbie")
                }
                .padding()
                
                NavigationLink(destination: UserProfilesView()) {
                    Text("John")
                }
                .padding()
                
                NavigationLink(destination: UserProfilesView()) {
                    Text("Megan")
                }
                .padding()
            
            }
            .frame(maxWidth: 300)
            .background(Color("Bright Orange"))
            .padding()
                
                Spacer()
                Spacer()
                
            }
            .foregroundColor(Color("Dark Grey"))
            .navigationBarTitle("Patient Management", displayMode: .inline)
           
            

           
            
        }
        
        
       
    }
              
}

struct PatientManagementView_Previews: PreviewProvider {
    static var previews: some View {
        PatientManagementView()
    }
}
