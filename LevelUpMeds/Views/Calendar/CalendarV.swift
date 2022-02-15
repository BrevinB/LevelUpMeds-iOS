//
//  Calendar.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import SwiftUI

struct CalendarV: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var appViewModel = appointmentViewModel()
    @ObservedObject private var calendarModel = CalendarViewModel()
    @ObservedObject var uerViewModel = profileViewModel()
    @ObservedObject private var medicationModel = medicationViewModel()
    @Namespace var animation
    private let dateFormatter = DateFormatter()
    var a = "a"
    
    init() {
        appViewModel.profileList = uerViewModel.filteredProfiles
        appViewModel.date = calendarModel.currentDay
        dateFormatter.dateFormat = "hh:mm a"
        calendarModel.filterTodayAppointments()
        medicationModel.fetchData()
        appViewModel.fetchData()
    }
    
 
    
    var body: some View {
       
        
        ZStack {
            
            //BackgroundColor(color: "Creamy Blue")
            
            ScrollView(.vertical, showsIndicators: false) {
                
                //Mark: Lazy Stack with pinned header
                LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                    
                    Section {
                        
                        //Current week view
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                
                                ForEach(calendarModel.currentWeek, id: \.self) { day in
                                    
                                    VStack(spacing: 10) {
                                        
                                        Text(calendarModel.extractDate(date: day, format: "dd"))
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                        
                                        //EEE will return day as MON, TUE,....
                                        Text(calendarModel.extractDate(date: day, format: "EEE"))
                                            .font(.system(size: 14))
                                        
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 8, height: 8)
                                            .opacity(calendarModel.isToday(date: day) ? 1 : 0)
                                    }
                                    //Foreground Style
                                    .foregroundStyle(calendarModel.isToday(date: day) ? .primary : .secondary)
                                    .foregroundColor(calendarModel.isToday(date: day) ?
                                                     colorScheme == .dark ? .black : .white :
                                                     colorScheme == .dark ? .white : .black)
                                    //Capsule Shape
                                    .frame(width: 45, height: 90)
                                    .background(
                                        ZStack {
                                            //Matched Geomtry Effect
                                            if calendarModel.isToday(date: day) {
                                                Capsule()
                                                    .fill(Color("Bright Orange"))
                                                    .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                            }
                                        }
                                    )
                                    .contentShape(Capsule())
                                    .onTapGesture {
                                        //Updating Current Day
                                        withAnimation {
                                            calendarModel.currentDay = day
                                            appViewModel.date = day
                                        }
                                    }
                                    
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        VStack {
                            
                            Text("Medication")
                                .font(.title.bold())
                                .offset(x: -100)
                            //MedicationView()
                            
                            Text("Appointments")
                                .font(.title.bold())
                                .offset(x: -80)
                            AppointmentsView()
                            
                      
                        }
                       
                    
                            
                    } header: {
                        HeaderView()
                    }
                }
            }
        }
    }
    
    //Appointments View
    func AppointmentsView() -> some View {

        LazyVStack(spacing: 20) {

            
            //x`if let appointment = appViewModel.appointment {
            if let appointment = appViewModel.allProfilesForAccount {
                
                if appointment.isEmpty {
                    Text("No appointments found")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y: 0)
                } else {
                    
                    Text("NOT EMPTY")
                    
                    ForEach(appointment) { appointment in
                        CardView(appointment: appointment)
                    }
                }

            } else {
                //Progress View
                ProgressView()
                    .offset(y: 100)
            }

        }
        .padding()
        .padding(.top)
        .onChange(of: calendarModel.currentDay) { newValue in
            
            calendarModel.filterTodayAppointments()

        }

    }
       
    //Medication View
    func MedicationView() -> some View {
        
        LazyVStack(spacing: 20) {
         
            if let medication = medicationModel.medication {
                if medication.isEmpty {
                    Text("No Medication Found")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y: 100)
                } else {
                    ForEach(medication) { medication in
                        
                        MedicationCardView(medication: medication)
                        
                    }

                }
            } else {
                ProgressView()
                    .offset(y: 100)
            }

        }
        .padding()
        .padding(.top)
    }
        
    
    //Appointment Card View
    func AppointmentCardView(appointment: Appointment) -> some View {
        
        HStack(alignment: .top, spacing: 30) {
            VStack(spacing: 10) {
                Circle()
                    .fill(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? .black : .clear)
                    .frame(width: 15, height: 15)
                    .background(
                    
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .padding(-3)
                    )
                    .scaleEffect(!calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 0.8 : 1)
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
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
                
                if calendarModel.isCurrentHour(date: appointment.appointmentDate) {

                    HStack(spacing: 0) {
                        HStack(spacing: -10) {


                                Image(systemName: "\(a).circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                    .background(

                                        Circle()
                                            .stroke(.black, lineWidth: 5)
                                    )
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
            .foregroundColor(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? .white : .black)
            .padding(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 15 : 0)
            .padding(.bottom, calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 0 : 10)
            .hLeading()
            .background(
            
                Color(.black)
                    .cornerRadius(25)
                    .opacity(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 1 : 0)
                
            )
        }
        .hLeading()
    }
    
    func MedicationCardView(medication: Medication) -> some View {
        HStack(alignment: .top, spacing: 30) {
            VStack(spacing: 10) {
                Circle()
                    .fill(calendarModel.isCurrentHour(date: Date.now) ? .black : .clear)
                    .frame(width: 15, height: 15)
                    .background(
                    
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .padding(-3)
                        
                    )
                    .scaleEffect(!calendarModel.isCurrentHour(date: Date.now) ? 0.8 : 1)
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 8)
            }
            
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(medication.name)
                            .font(.title2.bold())
                        
                        Text(medication.notes)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .hLeading()
                    
                    Text(dateFormatter.string(from: medication.time))
                }
            }
            .foregroundColor(calendarModel.isCurrentHour(date: Date.now) ? .white : .black)
            .padding(calendarModel.isCurrentHour(date: Date.now) ? 15 : 0)
            .padding(.bottom, calendarModel.isCurrentHour(date: Date.now) ? 0 : 10)
            .hLeading()
            .background(
            
                Color(.black)
                    .cornerRadius(25)
                    .opacity(calendarModel.isCurrentHour(date: Date.now) ? 1 : 0)
            
            )
        }
    }
        
    
    //Mark: Header
    func HeaderView() -> some View {
        HStack(spacing: 10) {
          
            VStack(alignment: .leading, spacing: 10) {
                Text(calendarModel.currentDay.formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(calendarModel.todayEmpty(date: calendarModel.currentDay) ? colorScheme == .dark ? .white : .black : .gray)
                    .font(calendarModel.todayEmpty(date: calendarModel.currentDay)
                          ? .system(size: 30) : .system(size: 15))
                    .fontWeight(calendarModel.todayEmpty(date: calendarModel.currentDay)
                                ? .bold : .regular)
                
                Text(calendarModel.getDay(date: calendarModel.currentDay))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.largeTitle.bold())
                    
            }
            .hLeading()
            
//            Button {
//
//            } label: {
//                Image(systemName: "a.circle.fill")
//                    .resizable()
//                    .frame(width: 45, height: 45)
//
//            }
            
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(colorScheme == .dark ? .black : .white)
    }
    
}

struct CalendarV_Previews: PreviewProvider {
    static var previews: some View {
        CalendarV()
    }
}

//UI Design Helper functions
extension View {
    
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    // MARK: Safe Area
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}
