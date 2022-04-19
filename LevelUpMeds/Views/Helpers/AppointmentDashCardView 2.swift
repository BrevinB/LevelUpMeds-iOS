//
//  AppointmentDashCardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/6/22.
//

import SwiftUI

struct AppointmentDashCardView: View {
    
    var name: String
    var address: String
    var time: String
    //var nameIcon: String
    var addExtension: Bool = false
    @State private var takeMed: Bool = false
    @State private var skipMed: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "a.circle.fill")
                    .padding(.leading, 10)
                Spacer()
                Text(time)
                    .fontWeight(.semibold)
                Spacer()
            }
            .frame(width: 360, height: 30)
            .background(Color("Dark Grey"))
            .foregroundColor(.white)
            
                
            HStack() {
                
                
                VStack {
                    Image(systemName: "calendar.badge.clock")
                        .padding([.trailing], 40)
                        .padding(.horizontal)
                }
                
                VStack {
                  
                    Text(name)
                        .font(.title3)
                    Text(address)
                   
                    
                }
                
                Spacer()
                
                if addExtension == true {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding()
                }
                
                
            }
            
            
           
            HStack {
                Text("")
                    .frame(width: 180, height: 15)
                    .background(.white)
            }
        
            
        
        }
    }
}

struct AppointmentDashCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppointmentDashCardView(name: "Doctor Appointment",
                                    address: "1234 Appointment Drive",
                                    time: "1:23 PM")
                .preview(with: "Preview w/out extension")
        
            AppointmentDashCardView(name: "Doctor Appointment",
                                    address: "1234 Appointment Drive",
                                    time: "1:23 PM",
                                    addExtension: true)
                .preview(with: "Preview w/ extension")
        
        }
        
    }
}
