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
            ZStack {
                
                BackgroundColor(color: "Creamy Blue")
                
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
                        
                        
                        NavigationLinkButtons(text: "Login",
                                              color: "Bright Orange",
                                              view: AnyView(LoginView()))
                          
                        
                        NavigationLinkButtons(text: "Sign Up",
                                              color: "Bright Orange",
                                              view: AnyView(SignUpView()))
                            
                    
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
