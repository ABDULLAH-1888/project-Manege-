//
//  MyChallengeViewController.swift
//  withyou
//
//  Created by Abdullah on 10/06/1446 AH.
//

import UIKit

class MyChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
   
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    // بيانات التحديات اليومية
    let challenges = [
        "مارس التنفس العميق لمدة 3 دقائق",
        "اكتب ثلاثة أشياء تشعر بالامتنان من أجلها",
        "قم بالمشي لمدة 30 دقيقة"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // إعداد TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // ضبط DatePicker ليعرض الوقت فقط
        timePicker.datePickerMode = .time
        
        // تحميل الوقت المخزن مسبقًا (إن وجد)
        if let savedTime = UserDefaults.standard.object(forKey: "notificationTime") as? Date {
            timePicker.date = savedTime
        }
        
        // طلب إذن الإشعارات
        requestNotificationPermission()
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = challenges[indexPath.row]
        return cell
    }
    
    

    
    
    @IBAction func saveTimeButtonTapped(_ sender: Any) {
        
        
        let selectedTime = timePicker.date
                
                // حفظ الوقت في UserDefaults
                UserDefaults.standard.set(selectedTime, forKey: "notificationTime")
                
                // جدولة الإشعار بناءً على الوقت المحدد
                scheduleDailyNotification(at: selectedTime)
                
                // تأكيد الحفظ للمستخدم
                let alert = UIAlertController(title: "تم الحفظ", message: "تم تحديد وقت التحدي اليومي.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "موافق", style: .default))
                present(alert, animated: true)
            
            
    }
    
    // MARK: - Notification Methods
    
    func scheduleDailyNotification(at time: Date) {
        let content = UNMutableNotificationContent()
        content.title = "تحدي اليوم"
        content.body = "لا تنسَ القيام بتحدي اليوم!"
        content.sound = UNNotificationSound.default
        
        // استخراج الساعة والدقيقة من الوقت المحدد
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: time)
        let minute = calendar.component(.minute, from: time)
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "DailyChallengeNotification", content: content, trigger: trigger)
        
        // إزالة أي إشعارات مجدولة سابقة
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["DailyChallengeNotification"])
        
        // إضافة الإشعار الجديد
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("خطأ في جدولة الإشعار: \(error)")
            } else {
                print("تم جدولة الإشعار ليتم إرساله يوميًا في \(hour):\(minute).")
            }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("تم منح إذن الإشعارات.")
            } else if let error = error {
                print("خطأ في طلب إذن الإشعارات: \(error)")
            }
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    

    


