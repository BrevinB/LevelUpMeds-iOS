//
//  AppointementDetailView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/5/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct AppointmentDetailView: View {
    
    @ObservedObject private var appointmentVM = appointmentViewModel()
    
    let name: String
    let address: String
    let time: String
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.186973, longitude: -85.101428), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
  
    var body: some View {
            
            VStack {
                ZStack() {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.white)
                        .frame(width: 360, height: 135)
                        .shadow(color: .gray, radius: 25, x: -10, y: 10)
                    
                    
                    
                    VStack() {
                       
                        AppointmentDashCardView(name: name, address: address, time: time)
                        
                       
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                
                Spacer()
    
                Map(coordinateRegion: $location)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                
                Spacer()
                Spacer()
                
                
            }
    }
}

struct AppointementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDetailView(name: "Doctor App", address: "1234 App Dr", time: "1:30")
    }
}

func getCoordinate(addressString: String,
                   completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void) {
    
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placemarks, error) in
        if error == nil {
            if let placemark = placemarks?[0] {
                let location = placemark.location!
                
                completionHandler(location.coordinate, nil)
                return
            }
        }
        
        completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        
    }
}
