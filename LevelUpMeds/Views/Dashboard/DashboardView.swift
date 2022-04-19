//
//  Calendar.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import SwiftUI

struct DashboardView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var appViewModel: appointmentViewModel
    @ObservedObject private var calendarModel = CalendarViewModel()
    @ObservedObject var uerViewModel = profileViewModel()
    @ObservedObject private var medicationVM: medicationViewModel
    @Namespace var animation
    private let dateFormatter = DateFormatter()
    private let dateFormatter2 = DateFormatter()
    private let dateFormatter3 = DateFormatter()
    private let formatter = ISO8601DateFormatter()
    @State private var isLoaded = false
    
    init(appViewModel: appointmentViewModel, medicationVM: medicationViewModel) {
        self.appViewModel = appViewModel
        self.medicationVM = medicationVM
        calendarModel.currentDay = Date.now
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter2.dateFormat = "MM/dd/yyyy"
        dateFormatter3.dateFormat = "EEEE"
        dateFormatter.timeZone = TimeZone.current
        uerViewModel.fetchData()
        getAppointments()
        getMedications()
    }
    
 
    
    var body: some View {
       
            
            ScrollView(.vertical, showsIndicators: false) {
                
                //Mark: Lazy Stack with pinned header
                LazyVStack(spacing: 15) {
                    
                    
                    
                    Section {
                        
                       
//                        Button(action: {
//                            getAppointments()
//                            getMedications()
//                        }, label: {
//                            Text("Refresh Dashbaord")
//                                .frame(width: 180, height: 40)
//                                .background(Color("Bright Orange"))
//                                .clipShape(Capsule())
//                                .foregroundColor(.white)
//                        })
                        
                        LazyVStack() {
                            VStack() {
                                Text("Medication")
                                    .font(.title.bold())
                                .offset(x: -100)
                                MedicationView()
                            }
                            
                            VStack {
                                Text("Appointments")
                                    .font(.title.bold())
                                .offset(x: -80)
                                AppointmentsView()
                            }
                            
                            
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                    
                            
                    } header: {
                        HeaderView()
//                        Divider()
//                         .frame(height: 2)
//                         .padding(.horizontal, 20)
//                         .background(Color("Bright Orange"))
                        
                    }
                    
                    
                }
                .onAppear {
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                       //Your code

                        if !isLoaded {
                            //print("loading")
                            calendarModel.filteredMedications.removeAll()
                            calendarModel.filteredAppointments.removeAll()
                            medicationVM.allMedications.removeAll()
                            appViewModel.allAppointments.removeAll()
                            getAppointments()
                            getMedications()
                            isLoaded = true
                        }
                    }
                    
                    
                }
                
                
            }.edgesIgnoringSafeArea(.all)
    }
    
    //Appointments View
    func AppointmentsView() -> some View {

        VStack(spacing: 20) {

            
            //x`if let appointment = appViewModel.appointment {
            if let appointment = calendarModel.filteredAppointments {
                
                if appointment.isEmpty {
                    Text("No Upcoming Appointments")
                        .font(.system(size: 16))
                        .fontWeight(.light)
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
                    Text("No Upcoming Medications")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                } else {
                    ForEach(medication) { medication in
                        
                        NavigationLink(destination: MedicationInfo(medication: medication), label: {
                            MedicationCardView(medication: medication, showAdditional: true, currDate: Date())
                        })
                        
                        
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
           
            Text("Dashboard")
             .font(.system(size: 25))
             .fontWeight(.bold)
                
                
            
                
            
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(colorScheme == .dark ? .black : .white)
    }
    
    func getAppointments() {

        let now = Date.now

        let later = Date.now.addingTimeInterval(30000)

        let range = now...later

        for prof in uerViewModel.filteredProfiles {

            appViewModel.getAllAppointments(profileID: prof.documentID)
        }
        

        calendarModel.filteredAppointments = appViewModel.allAppointments.filter { app in

            range.contains(app.appointmentDate)

        }
        
    }
    
    func getMedications() {
        
        let calendar = Calendar.current
        let pastHour = calendar.component(.hour, from: Date.now)
        
        for prof in uerViewModel.filteredProfiles {
            
            medicationVM.getAllMedications(profileID: prof.documentID)
            
        }
        
        for med in medicationVM.allMedications {
           
            let hour = calendar.component(.hour, from: med.time)

           
            let days = getMedicationDay(medication: med)

           
            if days.contains(dateFormatter3.string(from: calendarModel.currentDay)) && hour >= pastHour && hour < 24  {
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

struct DashboardView_Preview: PreviewProvider {
    static var previews: some View {
        DashboardView(appViewModel: appointmentViewModel(), medicationVM: medicationViewModel())
    }
}

extension Date {
    
    var startOfDay: Date {
           return Calendar.current.startOfDay(for: self)
       }
    
    var endOfDay: Date {
            var components = DateComponents()
            components.day = 1
            components.second = -1
            return Calendar.current.date(byAdding: components, to: startOfDay)!
        }
}
