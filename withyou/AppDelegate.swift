//
//  AppDelegate.swift
//  withyou
//
//  Created by Abdullah on 06/05/1446 AH.
//

import UIKit
import Firebase // استيراد Firebase إذا كنت تستخدمه
import UserNotifications // استيراد مكتبة الإشعارات

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // يتم استدعاء هذه الدالة عند اكتمال إطلاق التطبيق
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // تهيئة Firebase إذا كنت تستخدمه
        FirebaseApp.configure()
        
        // طلب إذن الإشعارات
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("إذن الإشعارات ممنوح.")
            } else if let error = error {
                print("خطأ في طلب إذن الإشعارات: \(error.localizedDescription)")
            } else {
                print("إذن الإشعارات مرفوض.")
            }
        }
        
        print("Application did finish launching")
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    // يتم استدعاء هذه الدالة عند إنشاء جلسة جديدة (Scene Session)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // تكوين الجلسة باستخدام الإعداد الافتراضي
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    // يتم استدعاء هذه الدالة عند حذف جلسات (Scene Sessions)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // تحرير أي موارد مرتبطة بجلسات تم حذفها.
        print("Scene sessions discarded: \(sceneSessions)")
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    // عرض الإشعارات حتى عندما يكون التطبيق مفتوحًا
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
