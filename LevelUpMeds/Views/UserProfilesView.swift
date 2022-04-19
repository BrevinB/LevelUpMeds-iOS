//
//  PatientMenuView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/28/21.
//

import SwiftUI
import Firebase

struct UserProfilesView: View {

    @ObservedObject private var profileVM = profileViewModel()
    @ObservedObject private var medicationVM = medicationViewModel()
    @ObservedObject private var medHistVM = medHistoryViewModel()
    @ObservedObject private var appointmentVM = appointmentViewModel()
    @ObservedObject private var notesVM = notesViewModel()
    @State private var isAddingProfile = false
    @State private var isDeleting = false
    @State private var isLoading = false
    

   
    
    init() {
        profileVM.fetchData()
        medicationVM.fetchData()
        appointmentVM.fetchData()
        medHistVM.fetchData()
        notesVM.fetchData()
    }

    var body: some View {
    
        NavigationView {
            
            ZStack {
                
                VStack {
                        
                        List {
                            
                            ForEach(profileVM.filteredProfiles) { profile in
                                NavigationLink(destination: IndividualProfileView(profileID: "/Profiles/\(profile.documentID)", name: profile.fname)) {
                                    UserProfile(name: profile.fname, imageName: "\(profile.initial).circle.fill")
                            }
                            }
                            .onDelete(perform: removeProfile)
                            

                        }
                        
                        if profileVM.filteredProfiles.isEmpty {
                            Text("Please add a profile")
                        }
                        
                        ButtonView(title: "Add User") {
                          
                            isAddingProfile.toggle()
                            
                        }
                        .sheet(isPresented: $isAddingProfile, onDismiss: {
                            profileVM.fetchData()
                        },
                        content: {
                            AddProfileView()
                        })
                        
                        
                        Spacer()
                        Spacer()
                        
                    }.padding(.top, 200)
                    .edgesIgnoringSafeArea(.top)
            
                if isLoading {
                    LoadingView()
                }
            }
        }
            
           
    }
    
    func removeProfile(at offsets: IndexSet) {
        
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            medicationVM.fetchData()
            appointmentVM.fetchData()
            medHistVM.fetchData()
            notesVM.fetchData()
           
            for item in offsets {
                //get profile being deleted
                let profile = profileVM.filteredProfiles[item]
                notesVM.getNotesForProfile(profileID: profile.documentID)
                medicationVM.getAllMedications(profileID: profile.documentID)
                appointmentVM.getAllAppointments(profileID: profile.documentID)
                //get all medications associated with the acount
                //medicationVM.allMedications.removeAll()
            
                    //get all medHistories associated with medications and delete med and hist
                    if !medicationVM.allMedications.isEmpty {
                        for med in medicationVM.allMedications {
                            let hist = medHistVM.getMedHistory(med: med)
                            medicationVM.deleteMedication(medication: med, medHist: hist)
                        }
                    } else {
                        print("No med or med hist")
                    }
                    
                    if !appointmentVM.allAppointments.isEmpty {
                        for app in appointmentVM.allAppointments {
                            appointmentVM.deleteAppointment(app: app)
                        }
                    } else {
                        print("no app")
                    }
                    
                    //TODO: Remove notes here
                    if !notesVM.allNotes.isEmpty {
                        for n in notesVM.allNotes {
                            notesVM.deleteNote(note: n)
                        }
                    } else {
                        print("no note")
                    }
                
                
                
               profileVM.deleteProfile(profile: profile)
            
            
               profileVM.fetchData()
            }
            
            isLoading = false
            
        }
        
       
    }
        
    
    }


struct PatientMenuView_Previews: PreviewProvider {
    static var previews: some View {
        
            UserProfilesView()
        
    }
}


