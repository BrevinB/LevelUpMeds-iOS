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
    
    private var name: String = ""
    private var address: String = ""
    private var time: String = ""
    @State private var location = CLLocationCoordinate2D()
    @State private var region = MKCoordinateRegion()
   
    
    var appointment: Appointment
    
    init(appointment: Appointment) {
        
        self.appointment = appointment
        
    }
  
    var body: some View {
            
            VStack {
                    
                    
                    VStack() {
                       
                        AppointmentCardView(appointment: appointment, showAdditional: false)
                        
                       
                    }
                    .padding()
                    .foregroundColor(.black)
                
                

//                Map(coordinateRegion: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location?.latitude, longitude: location?.longitude))
//                    .ignoresSafeArea(edges: .top)
//                    .frame(height: 400)
                
                
                Map(coordinateRegion: $region)
                    

                }
                .onAppear {
                    
                    appointmentVM.getLocation(appointment: appointment) { coordinates in
                        location = coordinates!
                        //setRegion()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        setRegion()
                    }
                   
            }
        
       
}

struct AppointementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let appointment: Appointment = Appointment(documentID: "",
                                                   appointmentDate: Date(),
                                                      address: "6215 Ranger Trail, Fort Wayne, Indiana",
                                                      name: "Covid Test",
                                                      notes: "Testing for da cove",
                                                      profileID: "")
        
        AppointmentDetailView(appointment: appointment)
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
    
    func setRegion() {
        
        print(location)

        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
}
