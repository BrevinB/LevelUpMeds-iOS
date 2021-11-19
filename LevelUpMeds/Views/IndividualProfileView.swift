//
//  AccountView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 10/27/21.
//

import SwiftUI

struct IndividualProfileView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                
                ScrollView {
                    
                    VStack() {
                
                        VStack(alignment: .leading) {
                            Text("Medicaiton")
                                .font(.title)
                                .padding([.leading], 20)
                            MedicationCardView()
                            MedicationCardView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .font(.title)
                                .padding([.leading], 20)
                            NotesCardView()
            
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Schedule")
                                .font(.title)
                                .padding([.leading], 20)
                            ScheduleCardView()
            
                        }
                       
                        
                        Spacer()
                        Spacer()
                            
                    }
                }
                
            }
        }
        .navigationTitle("Alex")
        .navigationBarTitleDisplayMode(.automatic)
       
    
    }
}

struct IndividualProfileView_Preview: PreviewProvider {
    static var previews: some View {
        IndividualProfileView()
    }
}


struct MedicationCardView: View {

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 100)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            HStack {
                VStack {
                    Image(systemName: "pills.fill")
                        .padding([.trailing], 40)
                }
                
                VStack {
                    Text("Name:")
                    Text("Dosage:")
                    Text("Time:")
                    Text("Recurrence:")
                }
                
                VStack {
                    Text("Medication Name")
                    Text("1 pill")
                    Text("12:00 PM")
                    Text("Dailey")
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
            
            HStack() {
                VStack {
                    Image(systemName: "note.text")
                        .padding()
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("11/12/2021")
                        .font(.title3)
                    Text("Note about patient detailing")
                }
                
                Spacer()
            }
            
        }
        .padding()
        }
    }


struct ScheduleCardView: View {

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 100)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            HStack() {
                VStack {
                    Image(systemName: "calendar.badge.clock")
                        .padding()
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("11/12/2021")
                        .font(.title3)
                    Text("Doctors Appointement")
                    Text("Doctor's Name")
                }
                
                Spacer()
            }
            
        }
        .padding()
        }
    }



