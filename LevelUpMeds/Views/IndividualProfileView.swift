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
    @ObservedObject private var notesVM = notesViewModel()
    
    @State private var isNotesEmpty: Bool = false
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
        notesVM.profileID = self.profileID
        notesVM.fetchData()
        medicationVM.fetchData()
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
                                        AddNewMedicationView(profileID: profileID)
                                    })
                                } else {
                                    
                                    if medicationVM.filteredMedications.count > 2 {
                                        NavigationLink(destination: MedicationInfo(medication: medicationVM.filteredMedications[0]), label: {
                                            MedicationCardView(medication: medicationVM.filteredMedications[0], showAdditional: false, currDate: Date())
                                                .padding()
                                        })
                                        
                                        NavigationLink(destination: MedicationInfo(medication: medicationVM.filteredMedications[1]), label: {
                                            MedicationCardView(medication: medicationVM.filteredMedications[1], showAdditional: false, currDate: Date())
                                                .padding()
                                        })
                                    } else {
                                        
                                        ForEach(medicationVM.filteredMedications) { med in
                                            
                                            NavigationLink(destination: MedicationInfo(medication: med), label: {
                                                MedicationCardView(medication: med, showAdditional: false, currDate: Date())
                                                    .padding()
                                            })
                                            
                                        }
                                    }
                                  
                                    
                                    
                                    HStack {
                                        Spacer()
                                        NavigationLink(destination: MedicationList(profileID: profileID), label: {
                                            Text("See All Medication")
                                                .frame(width: 350, height: 50)
                                                .background(Color("Bright Orange"))
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        })
                                        Spacer()
                                    }

                                }
                            }
                            
                        }
                        
                        
                        //Show appointments
                        VStack(alignment: .leading) {
                            Text("Appointments")
                                .font(.title)
                                .padding([.leading], 20)
                            
                            VStack(spacing: 16) {
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
                                    
                                    if appointmentVM.filteredAppointments.count > 2 {
                                       
                                        NavigationLink(destination: AppointmentDetailView(appointment: appointmentVM.filteredAppointments[0])) {
                                            AppointmentCardView(appointment: appointmentVM.filteredAppointments[0], showAdditional: false)
                                                .padding()
                                        }
                                        NavigationLink(destination: AppointmentDetailView(appointment: appointmentVM.filteredAppointments[1])) {
                                            AppointmentCardView(appointment: appointmentVM.filteredAppointments[1], showAdditional: false)
                                                .padding()
                                        }
                                        
                                    } else {
                                        ForEach(appointmentVM.filteredAppointments) { app in
                                            NavigationLink(destination: AppointmentDetailView(appointment: app), label: {
                                                AppointmentCardView(appointment: app, showAdditional: false)
                                                    .padding()
                                            })
                                        }
                                    }
                                    
                                    HStack {
                                        Spacer()
                                        NavigationLink(destination: AppointementListView(profileID: profileID), label: {
                                            Text("See All Appointments")
                                                .frame(width: 350, height: 50)
                                                .background(Color("Bright Orange"))
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        })
                                        Spacer()
                                    }
                            }
                           
                            }
                           
            
                        }
                        
                        //Show Notes
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .font(.title)
                                .padding([.leading], 30)


                            VStack(spacing: 16) {
                                
                                if notesVM.filteredNotes.isEmpty {
                                    Text("No Notes")
                                        .padding()
                                    ButtonView(title: "Add Note") {
                                        isNotesEmpty.toggle()
                                    }
                                    .frame(width: 350, height: 50)
                                    .sheet(isPresented: $isNotesEmpty, onDismiss: {
                                        notesVM.fetchData()
                                    }, content: {
                                        NewNoteView(profileID: profileID)
                                    })
                                } else {
                                    
                                    if notesVM.filteredNotes.count > 2 {
                                        NavigationLink(destination: NotesDetailView(), label: {
                                            NotesCardView(note: notesVM.filteredNotes[0])
                                        })
                                        
                                        NavigationLink(destination: NotesDetailView(), label: {
                                            NotesCardView(note: notesVM.filteredNotes[1])
                                        })
                                    } else {
                                        ForEach(notesVM.filteredNotes) { n in
                                            NotesCardView(note: n)
                                        }
                                    }
                                    
                                    NavigationLink(destination: NotesListView(profileID: profileID), label: {
                                        Text("See All Notes")
                                            .frame(width: 350, height: 50)
                                            .background(Color("Bright Orange"))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    })
                                }
                            }
                        }
                       
                            
                    }
                }
        }
         .foregroundColor(.black)
         .ignoresSafeArea(edges: .all)
         .navigationBarHidden(true)
         .onAppear() {
             medicationVM.fetchData()
         }
       
    
    }
}

struct IndividualProfileView_Preview: PreviewProvider {
    static var previews: some View {
        IndividualProfileView(profileID: "", name: "")
    }
}





