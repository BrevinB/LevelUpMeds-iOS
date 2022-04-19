//
//  CalendarViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import SwiftUI

class CalendarViewModel: ObservableObject {

    @ObservedObject private var appointmentVM = appointmentViewModel()
    @ObservedObject private var profileVM = profileViewModel()
    
    //Current week days
    @Published var currentWeek: [Date] = []
    
    //Current Day
    @Published var currentDay: Date = Date.now
    
    //Filtering Today Appointments
    @Published var filteredAppointments: [Appointment] = []
    
    //Filtering Today Medications
    @Published var filteredMedications: [Medication] = []
    
    //Get appointments for account
//    @Published var allAppointments: [Appointment]?
    
    init() {
        profileVM.fetchData()
        getAllAppointments()
        fetchCurrentWeek()
    }
    
    //Filter Today Appointments
    func filterTodayAppointments() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current

            let filtered = self.appointmentVM.appointment.filter {
                return calendar.isDate($0.appointmentDate, inSameDayAs: self.currentDay)
            }

            DispatchQueue.main.async {
                withAnimation {
                    self.filteredAppointments = filtered
                }
            }
        }
    }
    func fetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (0...7).forEach { day in
            
           if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
               currentWeek.append(weekday)
            }
        }
    }
    
    //Extracting data
    func extractDate(date: Date, format: String) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    //Checking if current Date is Today
    func isToday(date: Date) -> Bool {
        
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    func isCurrentHour(date: Date) -> Bool {
        
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
    }
    
    //check if today, tomorrow yesterday or date
    func getDay(date: Date) -> String {
        
        //let calendar = Calendar.current
        
        if Calendar.current.isDateInToday(date) {
            return "Today"
        } else if Calendar.current.isDateInTomorrow(date) {
            return "Tomorrow"
        } else if Calendar.current.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return ""
        }
    }
    
    func todayEmpty(date: Date) -> Bool {
        if getDay(date: date) == "" {
            return true
        } else {
            return false
        }
    }
    
    func getAllAppointments() {
        
        profileVM.filteredProfiles.forEach { prof in
            //print(prof.documentID)
            appointmentVM.getAllAppointments(profileID: "/Profiles/\(prof.documentID)")
            
        }
    }
}
