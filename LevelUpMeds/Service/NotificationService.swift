//
//  NotificationService.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 4/15/22.
//

import SwiftUI
import Foundation
import UserNotifications

class NotificationService: ObservableObject {
    static let shared = NotificationService()
    @Published var settings: UNNotificationSettings?
   
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                self.fetchNotificationSettings()
                completion(granted)
            }
    }
    
    func fetchNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings() { settings in
            DispatchQueue.main.async {
                self.settings = settings
            }
        }
    }
    
    func scheduleNotifications() {
        
        var morningNotif = DateComponents()
        morningNotif.hour = 8
        morningNotif.minute = 0
        
        var noonNotif = DateComponents()
        noonNotif.hour = 12
        noonNotif.minute = 0
        
        var eveningNotif = DateComponents()
        eveningNotif.hour = 18
        eveningNotif.minute = 0
        
        let content = UNMutableNotificationContent()
        content.title = "Medication Reminder!"
        content.body = "Don't forget to take your medications!"
        content.sound = UNNotificationSound.default
        
        let morningTrigger = UNCalendarNotificationTrigger(dateMatching: morningNotif, repeats: true)
        let noonTrigger = UNCalendarNotificationTrigger(dateMatching: noonNotif, repeats: true)
        let eveningTrigger = UNCalendarNotificationTrigger(dateMatching: eveningNotif, repeats: true)

        let morningRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: morningTrigger)
        let noonRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: noonTrigger)
        let eveningRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: eveningTrigger)

        UNUserNotificationCenter.current().add(morningRequest)
        UNUserNotificationCenter.current().add(noonRequest)
        UNUserNotificationCenter.current().add(eveningRequest)
    }
}
