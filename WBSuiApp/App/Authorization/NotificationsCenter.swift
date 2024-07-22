//
//  NotificationsCenter.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 20.07.24.
//

import Foundation
import UserNotifications


struct Notification {
    var phoneNumber: String
    var code: String

    func isValid(_ inputCode: String) -> Bool {
        return inputCode == code
    }
}

extension Notification: Equatable {
    static func == (lhs: Notification, rhs: Notification) -> Bool {
        return lhs.phoneNumber == rhs.phoneNumber && lhs.code == rhs.code
    }

    static func != (lhs: Notification, rhs: Notification) -> Bool {
        return !(lhs == rhs)
    }
}

extension Notification: CustomStringConvertible {
    var description: String {
        return "\(phoneNumber) \(code)"
    }
}

struct NotificationList: Sequence {
    private var notifications: [Notification]

    init(notifications: [Notification]) {
        self.notifications = notifications
    }

    func makeIterator() -> Array<Notification>.Iterator {
        return notifications.makeIterator()
    }
}

class NotificationsManager {
    static let shared = NotificationsManager()
    
    private init() {}
    
    func addNotification(for notification: Notification) {
        let content = createNotificationContent(for: notification)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Ошибка при добавлении уведомления: \(error.localizedDescription)")
            }
        }
    }
    
    func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Разрешение на отправку уведомлений получено.")
                completion(true)
            } else {
                if let error = error {
                    print("Ошибка при запросе разрешения на отправку уведомлений: \(error.localizedDescription)")
                }
                completion(false)
            }
        }
    }
    
    func generateRandomCode(length: Int) -> String {
        let numbers = "0123456789"
        return String((0..<length).compactMap { _ in numbers.randomElement() })
    }

    private func createNotificationContent(for notification: Notification) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "Ваш код подтверждения на номер телефона \(notification.phoneNumber)"
        content.subtitle = notification.code
        content.sound = UNNotificationSound.default
        return content
    }
}
