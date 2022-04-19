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
    private let dateFormatter2 = DateFormatter()
    private let dateFormatter3 = DateFormatter()
    
    init() {
        //self.appViewModel = appViewModel
        //self.medicationModel = medicationVM
        //self.appViewModel.date = calendarModel.currentDay
        uerViewModel.fetchData()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter2.dateFormat = "MM/dd/yyyy"
        dateFormatter3.dateFormat = "EEEE"
        medicationModel.fetchData()
       // self.appViewModel.fetchData()
        
    }
    
 
    
    var body: some View {
       
        
        ZStack {
            
            //BackgroundColor(color: "Creamy Blue")
            
            ScrollView(.vertical, showsIndicators: false) {
                
                //Mark: Lazy Stack with pinned header
             LazyVStack(spacing: 15) {
                    
                    Section() {
                        
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
                            MedicationView()
                            
                            Text("Appointments")
                                .font(.title.bold())
                                .offset(x: -80)
                                AppointmentsView()
                            
                        }
                       
                    Spacer()
                    Spacer()
                    Spacer()
                            
                    } header: {
                        HeaderView()
                    }
                }
                .onChange(of: calendarModel.currentDay) { newValue in

                    calendarModel.filteredMedications.removeAll()
                    calendarModel.filteredAppointments.removeAll()
                    medicationModel.allMedications.removeAll()
                    appViewModel.allAppointments.removeAll()

                    getAppointments()
                    getMedications()

                }
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                       //Your code
                        getAppointments()
                        getMedications()
                    }
                    //getAppointments()
                    //getMedications()
        
                }
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
    
    //Appointments View
    func AppointmentsView() -> some View {

        VStack(spacing: 20) {

            
            if let appointment = calendarModel.filteredAppointments {

                if appointment.isEmpty {
                    Text("No Appointments Found")
                        .font(.system(size: 16))
                        .fontWeight(.light)
//                        .offset(y: 0)
                } else {

                    ForEach(appointment) { appointment in
                        
                        NavigationLink(destination: AppointmentDetailView(appointment: appointment), label: {
                            AppointmentCardView(appointment: appointment, showAdditional: true)
                        })
                        
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
        
       

    }
       
    //Medication View
    func MedicationView() -> some View {
        
        VStack(spacing: 20) {
         
            if let medication = calendarModel.filteredMedications {
                if medication.isEmpty {
                    Text("No Medication Found")
                        .font(.system(size: 16))
                        .fontWeight(.light)
//                        .offset(y: 100)
                } else {
                    ForEach(medication) { medication in
                        
                        NavigationLink(destination: MedicationInfo(medication: medication), label: {
                            MedicationCardView(medication: medication, showAdditional: true, currDate: calendarModel.currentDay)
                        })
                        
                    }

                }
            } else {
                ProgressView()
                    .offset(y: 100)
            }

        }
        .onAppear {
            getMedications()
        }
        .padding()
        .padding(.top)
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
            
            Image("smallLogo")
                .resizable()
                .frame(width: 40, height: 40)
            
            Spacer()
            Spacer()
            
            Text("Calendar")
                .font(.system(size: 26))
                .fontWeight(.bold)
                
            
            
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(colorScheme == .dark ? .black : .white)
    }
    
    func getAppointments() {
        
        for prof in uerViewModel.filteredProfiles {

            appViewModel.getAllAppointments(profileID: prof.documentID)
        }
    
        calendarModel.filteredAppointments = appViewModel.allAppointments.filter { app in
            
            dateFormatter2.string(from: app.appointmentDate) == dateFormatter2.string(from: calendarModel.currentDay)
            
        }
    }
    
    func getMedications() {
        
        
        for prof in uerViewModel.filteredProfiles {
            
            medicationModel.getAllMedications(profileID: prof.documentID)
            
        }
        
        for med in medicationModel.allMedications {
            

            let days = getMedicationDay(medication: med)

            
            if days.contains(dateFormatter3.string(from: calendarModel.currentDay)) {
                calendarModel.filteredMedications.append(med)
            }
            
        }

    }
    
    func getMedicationDay(medication: Medication) -> [String] {
        
        var dayName: [String] = []
        
        if medication.days["u"] == true {
            dayName.append("Sunday")
        }
        
        if medication.days["m"] == true {
            dayName.append("Monday")
        }
        
        if medication.days["t"] == true {
            dayName.append("Tuesday")
        }
        
        if medication.days["w"] == true {
            dayName.append("Wednesday")
        }
        
        if medication.days["r"] == true {
            dayName.append("Thursday")
        }
        
        if medication.days["f"] == true {
            dayName.append("Friday")
        }
        
        if medication.days["s"] == true {
            dayName.append("Saturday")
        }
        
        return dayName
        
    }
}

struct CalendarV_Previews: PreviewProvider {
    static var previews: some View {
        //CalendarV(appViewModel: appointmentViewModel(), medicationVM: medicationViewModel())
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
