//
//  AccountView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct IndividualProfileView: View {
    @State private var isNewNotePresented: Bool = false
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                   
                ScrollView {
                    
                    VStack() {
                
                        VStack(alignment: .leading) {
                            Text("Medication")
                                .font(.title)
                                .padding([.leading], 20)
                            
                            
                            
                            NavigationLink(destination: MedicationInfo(), label: {
                                MedicationCardView(time: "3:30 PM", medication: "Benadryl")
                            })
                                
                            
                            NavigationLink(destination: MedicationList(), label: {
                                MedicationCardView(time: "5:30 PM", medication: "Creatine")
                            })
                            
                            HStack {
                                Spacer()
                                NavigationLink(destination: MedicationList(), label: {
                                    Text("See All Medication")
                                        .frame(width: 150, height: 40)
                                        .background(Color("Bright Orange"))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                })
                                Spacer()
                            }
                         
                               
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Appointements")
                                .font(.title)
                                .padding([.leading], 20)
                            
                            NavigationLink(destination: AppointementDetailView(), label: {
                                AppointementCardView()
                            })
                           
                            HStack {
                                Spacer()
                                NavigationLink(destination: AppointementListView(), label: {
                                    Text("See All Appointements")
                                        .frame(width: 200, height: 40)
                                        .background(Color("Bright Orange"))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                })
                                Spacer()
                            }
            
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .font(.title)
                                .padding([.leading], 20)
                            
                            NavigationLink(destination: NotesEditView(), label: {
                                NotesCardView()
                            })
                           
                            HStack {
                                Spacer()
                                
                                NavigationLink(destination: NotesListView(), label: {
                                    Text("See All Notes")
                                        .frame(width: 200, height: 40)
                                        .background(Color("Bright Orange"))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                })
                                
                                Spacer()
                            }
                        }
                       
                        
                        Spacer()
                        Spacer()
                            
                    }
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
        IndividualProfileView()
    }
}


struct MedicationCardView: View {
    var time: String
    var medication: String
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 80)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                nameTagView(symbolName: "a.circle.fill",
                            name: "Alex",
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



