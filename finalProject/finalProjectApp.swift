//
//  finalProjectApp.swift
//  finalProject
//
//  Created by Muneera Y on 13/02/1445 AH.
//

import SwiftUI
import FirebaseCore
@main
struct finalProjectApp: App {
    
    @ObservedObject var UserData = UserDataViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
//            SignUp()
//            RootView()
            GamesListView().environmentObject(UserData)
//            FavoritesView().environmentObject(UserData)
        }
    }
}
