//
//  AuthViewModel.swift
//  finalProject
//
//  Created by Muneera Y on 26/02/1445 AH.
//

import Foundation
import Firebase
import Combine
class AuthViewModel: ObservableObject {
    @Published var user: User?
    private var cancellables: Set<AnyCancellable> = []
    
//    init() {
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if let user = user {
//                // The user is signed in, you can access their information here
//                self.user = user
//            } else {
//                // No user is signed in
//                self.user = nil
//            }
//        }
//    }

    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
