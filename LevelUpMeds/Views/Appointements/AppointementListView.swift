//
//  AppointementListView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/6/21.
//

import SwiftUI

struct AppointementListView: View {
    
    @State var profileID: String
    @State private var isAddingAppointment = false
    private let formatter1 = DateFormatter()
   
    @ObservedObject private var appointmentVM = appointmentViewModel()
    
    init(profileID: String) {
        self.profileID = profileID
        self.appointmentVM.fetchData()
        self.appointmentVM.profileID = profileID
    }
    
    var body: some View {
        NavigationView {
                
                VStack() {
                    
                    if appointmentVM.filteredAppointments.isEmpty {
                        Text("Please add an appointment")
                        
                    } else {
                        List(appointmentVM.filteredAppointments) { app in
                            
                            NavigationLink(destination: AppointmentDetailView(name: app.name,
                                                                               address: app.address,
                                                                               time: formatter1.string(from: app.appointmentDate))) {
                                AppointmentDashCardView(name: app.name,
                                                        address: app.address,
                                                        time: formatter1.string(from: app.appointmentDate),
                                                        addExtension: true)
                            }

                            
                        }
                    }
                    
                    ButtonView(title: "Add Appointment") {
                        isAddingAppointment.toggle()
                    }
                    .sheet(isPresented: $isAddingAppointment, onDismiss: {
                        self.appointmentVM.fetchData()
                    }) {
                        AddAppointmentView(profileID: profileID)
                    }
                    
                    Spacer()
                }
                .onAppear {
                    formatter1.dateFormat = "HH:MM"
                    }
            
        }
    }
}

struct AppointementListView_Previews: PreviewProvider {
    static var previews: some View {
        AppointementListView(profileID: "Profile")
    }
}
