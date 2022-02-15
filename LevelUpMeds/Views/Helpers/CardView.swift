//
//  CardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/10/22.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var appViewModel = appointmentViewModel()
    @ObservedObject private var calendarModel = CalendarViewModel()
    @ObservedObject var uerViewModel = profileViewModel()
    @ObservedObject private var medicationModel = medicationViewModel()
    var appointment: Appointment
    
    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            VStack(spacing: 10) {
                Circle()
                    .fill(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? colorScheme == .dark ? .white : .black : .clear)
                    .frame(width: 15, height: 15)
                    .background(
                    
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .padding(-3)
                    )
                    .scaleEffect(!calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 0.8 : 1)
                    
                
                Rectangle()
                    .fill(colorScheme == .dark ? .white : .black)
                    .frame(width: 3)
            }
            
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Appointment Name")
                            .font(.title2.bold())
                        
                        Text("Appointment Notes")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .hLeading()
                    
                     Text(appointment.appointmentDate.formatted(date: .omitted, time: .shortened))
                }
                
                if calendarModel.isCurrentHour(date: appointment.appointmentDate) {

                    HStack(spacing: 0) {
                        HStack(spacing: -10) {


                                Image(systemName: "a.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                    .background(

                                        Circle()
                                            .stroke(.black, lineWidth: 5)
                                    )
                            
                            Text("Name")
                                .padding()
                        }
                        .hLeading()
                        
                       
                        
                        Spacer()

//                        Button {
//
//                        } label: {
//                            Image(systemName: "checkmark")
//                                .foregroundStyle(.black)
//                                .padding(10)
//                                .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
//                        }
                    }
                    .padding(.top)
                }
            }
            .foregroundColor(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? .white : colorScheme == .dark ? .black : .white)
            .padding(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 15 : 0)
           .padding(.bottom, calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 0 : 10)
           
            .hLeading()
            .background(colorScheme == .dark ? Color(UIColor.darkGray) : Color.black)
                .cornerRadius(25)
                .opacity(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 1 : 0)
        }
        .hLeading()
    }
}

struct CardView_Previews: PreviewProvider {
    

    static var previews: some View {
        
        let appointment: Appointment = Appointment(appointmentDate: Date(),
                                                      address: "1234 App Dr",
                                                      name: "Covid Test",
                                                      notes: "Testing for da cove",
                                                      profileID: "")
        
        CardView(appointment: appointment)
            .preview(with: "Appointment Card View")
    }
}
