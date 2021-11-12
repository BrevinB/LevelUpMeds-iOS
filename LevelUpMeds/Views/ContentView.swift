//
//  ContentView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
            
            NavigationView() {
            VStack() {
                
                VStack {
                    Spacer()
                    BannerImmage(image: Image("logo"))
                }
                
                Spacer()
               
                Group() {
                    Spacer()
                    
                    HStack {
                        Text("WELCOME!")
                    }
                    .padding()
                    
                    
                    NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .padding()
                                .frame(width: 250, height: 60)
                                .background(Color("Bright Orange"))
                                .cornerRadius(20)

                                .font(.title)
                               }
                      
                    
                    NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .padding()
                                .frame(width: 250, height: 60)
                                .background(Color("Bright Orange"))
                                .cornerRadius(20)
                                .font(.title)
                               }
                        
                
                    Spacer()
                    Spacer()
                }
                .padding(10)
                .foregroundColor(.black)
                
                
            }
                .font(.title)
                .edgesIgnoringSafeArea(.all)
                
            
            }
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
