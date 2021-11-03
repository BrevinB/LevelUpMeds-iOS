//
//  ContentView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
        VStack() {
            
            VStack {
                Spacer()
                BannerImmage(image: Image("logo"))
            }
            .background(Color("Bright Orange"))
            
            Spacer()
           
            Group() {
                Spacer()
                
                HStack {
                    Text("WELCOME!")
                }
                .padding()
                
                
                Button(action: {
                    print("patient!")
                }) {
                    
                    HStack {
                        Text("Patient Login")
                    }
                    .padding()
                }
                    .background(Color("Bright Orange"))
                    .cornerRadius(20)
                
                
                NavigationLink(destination: LoginView()) {
                        Text("Caretaker Login")
                            .padding()
                            .background(Color("Bright Orange"))
                            .cornerRadius(20)
                            .font(.title)
                           }
                  
                
                Button(action: {
                    print("Setup!")
                }) {
                    
                    HStack {
                        Text("Sign Up")
                    }
                    .padding()
                }
                    .background(Color("Bright Orange"))
                    .cornerRadius(20)
                    
            
                Spacer()
                Spacer()
            }
            .padding(10)
            .foregroundColor(Color("Dark Grey"))
            
            
        }
            .font(.title)
            .background(Color("Creamy Blue"))
            .edgesIgnoringSafeArea(.all)
            
        
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
