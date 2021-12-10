//
//  AppointementDetailView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/5/21.
//

import SwiftUI
import MapKit

struct AppointementDetailView: View {
    
    var body: some View {
        ZStack {
            BackgroundColor(color: "Creamy Blue")
            
            VStack {
                ZStack() {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.white)
                        .frame(width: 360, height: 135)
                        .shadow(color: .gray, radius: 25, x: -10, y: 10)
                    
                    
                    
                    VStack() {
                       
                        AppointementDashCardView(type: "Appointement",
                                                 time: "10:30",
                                                 nameIcon: "h.circle.fill",
                                                 addExtension: false)
                        
                       
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                
                Spacer()
    
                MapView(coordinate: CLLocationCoordinate2D(latitude: 41.186973, longitude: -85.101428))
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                
                Spacer()
                Spacer()
                
                
            }
            
           
        }
    }
}

struct AppointementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppointementDetailView()
    }
}
