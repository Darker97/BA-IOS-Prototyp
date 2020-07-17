//
//  BA_PrototypApp.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 09.07.20.
//

import SwiftUI

@main
struct BA_PrototypApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        sleep(3)
        return true
    }
}
