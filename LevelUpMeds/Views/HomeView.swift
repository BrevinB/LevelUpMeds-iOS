//
//  HomeView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var tabSelection: Int
    var body: some View {
        NavigationView() {
            VStack() {
              
                VStack {
                    
                    BannerImmage(image: Image("logo"))
                }
                .background(Color("Dark Grey"))
                .padding()
                Spacer()
                
                Button(action: {
                    self.tabSelection = 2
                }) {
                    Text("Calendar")
                        .frame(width: 300, height: 50)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .padding()
                }
                
                NavigationLink(destination: PatientManagementView()) {
                    Text("Patient Management")
                        .frame(width: 300, height: 50)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .padding()
                }
       
               
                Button(action: {
                    self.tabSelection = 3
                }) {
                    Text("Account Management")
                        .frame(width: 300, height: 50)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .padding()
                }
            
            
            
            
                
                Spacer()
                Spacer()
                Spacer()
            }
            .foregroundColor(Color("Dark Grey"))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tabSelection: .constant(1))
    }
}
