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
//    init(){
//        FirebaseApp.configure()
//    }
    var body: some Scene {
        WindowGroup {
//            NavigationView{
                //            SignUp()
//                            RootView()
                //            GamesListView().environmentObject(UserData)
                //            mainView()
                //            AddCommentView().environmentObject(UserData)
            SplashScreenView()
                .environmentObject(UserData)
                .environmentObject(authViewModel)
                .onAppear {
                    // Add the listener when the main view appears
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if let user = user {
                            // The user is signed in, you can access their information here
                            self.authViewModel.user = user
                            print(authViewModel.user as Any)
                        } else {
                            // No user is signed in
                            self.authViewModel.user = nil
                        }
                    }
                }


        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure() // Initialize Firebase once

        return true
    }
}
