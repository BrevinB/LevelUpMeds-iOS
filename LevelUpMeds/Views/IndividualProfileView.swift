//
//  AccountView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct IndividualProfileView: View {
    
    @ObservedObject private var appointmentVM = appointmentViewModel()
    @ObservedObject private var medicationVM = medicationViewModel()
    
    @State private var isNewNotePresented: Bool = false
    @State private var isMedicationsEmpty: Bool = false
    @State private var isAppointmentEmpty: Bool = false
    @State var profileID: String
    @State var name: String
    
    
    private let dateFormatter = DateFormatter()
    
    init(profileID: String, name: String) {
        self.profileID = profileID
        self.name = name
        medicationVM.profileID = self.profileID
        appointmentVM.profileID = self.profileID
    }
    
    
    var body: some View {
        
        NavigationView {
                   
                ScrollView {
                    
                    VStack() {
                
                        //Display Medications
                        VStack(alignment: .leading) {
                            Text("Medication")
                                .font(.title)
                                .padding([.leading], 20)
                            
                            
                            VStack(spacing: 16) {
                                if medicationVM.filteredMedications.isEmpty {
                                    Text("No Medications")
                                        .padding()
                                    
                                    ButtonView(title: "Add Medications") {
                                        isMedicationsEmpty.toggle()
                                    }
                                    .frame(width: 350, height: 50)
                                    .sheet(isPresented: $isMedicationsEmpty, onDismiss: {
                                        medicationVM.fetchData()
                                    }, content: {
                                        MedicationEditView(profileID: profileID)
                                    })
                                } else {
                                    
                                    ForEach(medicationVM.filteredMedications) { med in
                                        if medicationVM.filteredMedications.count > 2 {
                                            if med.time < Date.now.addingTimeInterval(5000) {
                                                MedicationCardView(time: dateFormatter.string(from: med.time),
                                                                   medication: med.name,
                                                                   name: name)
                                            } else {
                                                MedicationCardView(time: dateFormatter.string(from: med.time),
                                                                   medication: med.name,
                                                                   name: name)
                                            }
                                        } else {
                                            
                                            MedicationCardView(time: dateFormatter.string(from: med.time),
                                                               medication: med.name,
                                                               name: name)
                                            
                                        }
                                    }
                                    
                                    
                                    HStack {
                                        Spacer()
                                        NavigationLink(destination: MedicationList(profileID: profileID), label: {
                                            Text("See All Medication")
                                                .frame(width: 150, height: 40)
                                                .background(Color("Bright Orange"))
                                                .foregroundColor(.black)
                                                .cornerRadius(10)
                                        })
                                        Spacer()
                                    }

                                }
                            }
                            
                        }
                        
                        
                        //Show appointments
                        VStack(alignment: .leading) {
                            Text("Appointements")
                                .font(.title)
                                .padding([.leading], 20)
                            
                           
                            //IF no appointments show button to add apointments
                            if appointmentVM.filteredAppointments.isEmpty {
                                Text("No Appointments")
                                    .padding()
                                ButtonView(title: "Add Appointment") {
                                    isAppointmentEmpty.toggle()
                                }
                                .frame(width: 350, height: 50)
                                .sheet(isPresented: $isAppointmentEmpty, onDismiss: {
                                    appointmentVM.fetchData()
                                }, content: {
                                    AddAppointmentView(profileID: profileID)
                                })
                            } else {
                                
                                ForEach(appointmentVM.filteredAppointments) { app in
                                    NavigationLink(destination: AppointmentDetailView(name: app.name, address: app.address, time: dateFormatter.string(from: app.appointmentDate)), label: {
                                        AppointmentDashCardView(name: app.name, address: app.address, time: dateFormatter.string(from: app.appointmentDate))
                                    })
                                }
                                
                                    
                               
                                
                                HStack {
                                    Spacer()
                                    NavigationLink(destination: AppointementListView(profileID: profileID), label: {
                                        Text("See All Appointements")
                                            .frame(width: 200, height: 40)
                                            .background(Color("Bright Orange"))
                                            .foregroundColor(.black)
                                            .cornerRadius(10)
                                    })
                                    Spacer()
                                }
                            }
                           
            
                        }
                        
                        //Show Notes
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .font(.title)
                                .padding([.leading], 20)
                            
//                            NavigationLink(destination: NotesEditView(), label: {
//                                NotesCardView()
//                            })
                           
                            Text("Add Notes")
                                .padding()
                            
                            ButtonView(title: "Add Notes") {
                                //TODO: Add notes navigation
                           
                            }
                            .frame(width: 350, height: 50)
                            
                            
//                            HStack {
//                                Spacer()
//
//                                NavigationLink(destination: NotesListView(), label: {
//                                    Text("See All Notes")
//                                        .frame(width: 200, height: 40)
//                                        .background(Color("Bright Orange"))
//                                        .foregroundColor(.black)
//                                        .cornerRadius(10)
//                                })
//
//                                Spacer()
//                            }
                        }
                       
                        
                        Spacer()
                        Spacer()
                            
                    }
                }
        }
         .foregroundColor(.black)
         .navigationTitle("Alex")
         .ignoresSafeArea(edges: .all)
         .navigationBarTitleDisplayMode(.inline)
         .navigationBarHidden(true)
       
    
    }
}

struct IndividualProfileView_Preview: PreviewProvider {
    static var previews: some View {
        IndividualProfileView(profileID: "", name: "")
    }
}


struct MedicationCardView: View {
    var time: String
    var medication: String
    var name: String =  "Name"

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 80)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                let initial = Array(name)[0]
                nameTagView(symbolName: "\(initial.lowercased()).circle.fill",
                            name: name,
                            time: time)
                HStack {
                    VStack {
                        Image(systemName: "pills.fill")
                            .padding([.trailing], 40)
                    }
                    
                    VStack {
                        Text("Name:")
                        Text("Dosage:")
                    }
                    
                    VStack {
                        Text(medication)
                        Text("1 pill")
                        
                    }
                    
                }
            }
            
        }
        .padding()
        }
    }

struct NotesCardView: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 100)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                
                nameTagView(symbolName: "a.circle.fill",
                            name: "Alex",
                            time: "6:30 PM")
                
                HStack() {
                    VStack {
                        Image(systemName: "note.text")
                            .padding()
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("12/09/2021")
                            .font(.title3)
                        Text("Alex's doctor's appointement was rescheduled......")
                    }
                    
                    Spacer()
                }
            }
            
        }
        .padding()
        }
    }


struct AppointementCardView: View {

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 100)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                
                nameTagView(symbolName: "a.circle.fill",
                            name: "Alex",
                            time: "6:30 PM")
                
                HStack() {
                    VStack {
                        Image(systemName: "calendar.badge.clock")
                            .padding()
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("12/10/2021")
                            .font(.title3)
                        Text("Doctors Appointement")
                        Text("Doctor's Name")
                    }
                    
                    Spacer()
                }
            }
            
        }
        .padding()
        }
    }



