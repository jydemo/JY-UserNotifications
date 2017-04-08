//
//  ViewController.swift
//  JY-UserNotifications
//
//  Created by atom on 2017/4/7.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    @IBAction func datePicker(_ sender: UIDatePicker) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("触发通知")
        createReminderNotification(at: Date())
    }
    
    private func createReminderNotification(at date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "JY"
        content.body = "dawis"
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = Identifier.reminderLater
        let tigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let identifier = "id"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: tigger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("\(error.localizedDescription)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

