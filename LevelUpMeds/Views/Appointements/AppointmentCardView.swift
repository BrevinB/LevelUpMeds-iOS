//
//  CardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/10/22.
//

import SwiftUI

struct AppointmentCardView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var appViewModel = appointmentViewModel()
    @ObservedObject private var calendarModel = CalendarViewModel()
    @ObservedObject var uerViewModel = profileViewModel()
    @ObservedObject private var medicationModel = medicationViewModel()
    var appointment: Appointment
    var showAdditional: Bool
    
    @State private var isShowingEdit = false
    
    init(appointment: Appointment, showAdditional: Bool) {
        self.appointment = appointment
        self.showAdditional = showAdditional
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
         
            if showAdditional {
                CardLines()
            }
            
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(appointment.name)
                            .font(.title2.bold())
                        
                        Text(appointment.notes)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .hLeading()
                    
                     Text(appointment.appointmentDate.formatted(date: .omitted, time: .shortened))
                }
                
                //if calendarModel.isCurrentHour(date: appointment.appointmentDate) {
             
                    let name = getProfileInitial()
                    let initial = name.prefix(1)
                    HStack(spacing: 0) {
                        
                        if showAdditional {
                            HStack(spacing: -10) {


                                Image(systemName: "\(initial.lowercased()).circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                        .background(

                                            Circle()
                                                .stroke(.white, lineWidth: 5)
                                        )
                                        

                                Text(name)
                                    .padding()
                            }
                            .hLeading()
                        }
                        
                        
                       
                        Spacer()

                        if !showAdditional {
                            Button(action: {
                                isShowingEdit.toggle()
                            }, label: {
                                Text("Edit")
                                    .padding(.horizontal)
                            })
                                .sheet(isPresented: $isShowingEdit, onDismiss: {
                                    appViewModel.fetchData()
                                }, content: {
                                    AppointmentEditView(appointment: appointment)
                                })
                        }
                    }
                    .padding(.top)
                //}
            }
            
                .foregroundColor(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? .white : colorScheme == .dark ? .black : .white)
                //.padding(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 15 : 0)
                .padding(15)
                .hLeading()
//                .background(colorScheme == .dark ? Color(UIColor.darkGray) : Color.black)
                .background(.black)
                    .cornerRadius(25)
               //.padding(.bottom, calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 0 : 10)
                    .padding(.bottom, 0)
                    //.opacity(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 1 : 0)
                    .opacity(1)
                
        }
        .hLeading()
    }
    
    func getProfileInitial() -> String {
        
        var name: String = "a"
        
        for prof in uerViewModel.filteredProfiles {
            
            if appointment.profileID == "/Profiles/\(prof.documentID)" {
                name = prof.fname
                break
            }
        }
        
        return name
    }
}

struct AppointmentCardView_Previews: PreviewProvider {
    

    static var previews: some View {
        
        let appointment: Appointment = Appointment(documentID: "",
                                                   appointmentDate: Date(),
                                                      address: "1234 App Dr",
                                                      name: "Covid Test",
                                                      notes: "Testing for da cove",
                                                      profileID: "/Profiles/k2f4OJeJS8JUs0kShO3O")
        
        Group {
            AppointmentCardView(appointment: appointment, showAdditional: true)
                .preview(with: "Appointment Card View with lines")
            
            AppointmentCardView(appointment: appointment, showAdditional: false)
                .preview(with: "Appointment Card View w/ lines")
        }
    }
}
