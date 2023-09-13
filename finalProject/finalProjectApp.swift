//
//  finalProjectApp.swift
//  finalProject
//
//  Created by Muneera Y on 13/02/1445 AH.
//

import SwiftUI
import FirebaseCore
import Firebase
@main
struct finalProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var UserData = UserDataViewModel()
    @ObservedObject var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {

            SplashScreenView()
                .environmentObject(UserData)
                .environmentObject(authViewModel)
             


        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure() // Initialize Firebase once
     
        return true
    }
}
