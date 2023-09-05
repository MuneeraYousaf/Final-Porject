////
////  UserDataViewModel.swift
////  finalProject
////
////  Created by Muneera Y on 17/02/1445 AH.
////
//
import Foundation
import SwiftUI
import FirebaseFirestore


class UserDataViewModel : ObservableObject {
    @Published var users: [UserModel] = []
    @Published var games: [GameData] = []
    
    //MARK: add user to firebase
    func addUser(username: String, email: String, phone: String, image: String) {
        // Create a dictionary with the user data.
        let userData: [String: Any] = [
            "username": username,
            "email": email,
            "phone": phone,
            "image": image
        ]
        
        // Reference the Firestore collection "users".
        let usersCollection = Firestore.firestore().collection("users")
        
        // Add the document to the "users" collection.
        usersCollection.addDocument(data: userData) { error in
            if let error = error {
                print("Error adding user document: \(error)")
            } else {
                print("User document added successfully!")
            }
        }
    }
    
    //MARK: Fetch user from firebase
    func fetchUsers() {
        Firestore.firestore()
            .collection("users")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching users: \(error)")
                    return
                }
                
                if let snapshot = snapshot {
                    snapshot.documentChanges.forEach { change in
                        DispatchQueue.main.async {
                            let id = change.document.documentID
                            let data = change.document.data()
                            
                            let newUser = UserModel(
                                id: id,
                                username: data["username"] as? String ?? "",
                                image: data["image"] as? String ?? "",
                                phone: data["phone"] as? String ?? "",
                                email: data["email"] as? String ?? ""
                            )
                            
                            switch change.type {
                            case .added:
                                // Append the new user to the array
                                self.users.append(newUser)
                            case .modified:
                                // Update the user in the array if it exists
                                if let index = self.users.firstIndex(where: { $0.id == newUser.id }) {
                                    self.users[index] = newUser
                                }
                            case .removed:
                                // Handle the removal of a user if needed
                                self.users.removeAll { $0.id == newUser.id }
                            }
                        }
                    }
                }
            }
    }
    //
    //    func fetchGames() {
    //        // Add a snapshot listener to the Firestore collection
    //        gamesCollection.addSnapshotListener { querySnapshot, error in
    //            if let error = error {
    //                print("Error fetching games: \(error.localizedDescription)")
    //                return
    //            }
    //            querySnapshot?.documentChanges.forEach { change in
    //                switch change.type {
    //                case .added:
    //                    if let data = change.document.data() {
    //                        let name = data["name"] as? String ?? ""
    //                        let id = data["id"] as? String ?? ""
    ////                        let images = data["images"]
    //                        let about = data["about"] as? String ?? ""
    //
    ////                        let details = data["details"]
    //                        // You can extract other fields here as needed
    ////                        let game = GameData(id: UUID().uuidString, name: name, images: [], about: "", details: [])
    ////                        self.games.append(game)
    ////                        let game = GameData(id: id, name: name, images: [], about: about, details: [])
    ////                                         self.games.append(game)
    //                    }
    //                default:
    //                    break
    //                }
    //            }
    //        }
    //    }
    
    
//    func fetchGames() {
//        Firestore.firestore()
//            .collection("games")
//            .addSnapshotListener { snapshot, error in
//                if let error = error {
//                    print("Error fetching users: \(error)")
//                    return
//                }
//
//                if let snapshot = snapshot {
//                    snapshot.documentChanges.forEach { change in
//                        DispatchQueue.main.async {
//                            let id = change.document.documentID
//                            let data = change.document.data()
//
//                            let gamefetch = GameData(id: id, name: data["name"] as? String ?? "", images: data["images"] as? Array<Image> ?? [], about: data["about"] as? String ?? "", details: data["name"] as? Array<Detail> ?? [], stars: data["stars"] as? Int ?? 0, age: data["age"] as? String ?? "")
//                            //                            UserModel(
//                            //                                id: id,
//                            //                                username: data["username"] as? String ?? "",
//                            //                                image: data["image"] as? String ?? "",
//                            //                                phone: data["phone"] as? String ?? "",
//                            //                                email: data["email"] as? String ?? ""
//                            //                            )
//
//
//                            switch change.type {
//                            case .added:
//                                // Append the new user to the array
//                                self.users.append(gamefetch)
//                            case .modified:
//                                // Update the user in the array if it exists
//                                if let index = self.users.firstIndex(where: { $0.id == newUser.id }) {
//                                    self.users[index] = gamefetch
//                                }
//                            case .removed:
//                                // Handle the removal of a user if needed
//                                self.users.removeAll { $0.id == gamefetch.id }
//                            }
//                        }
//                    }
//                }
//            }
//
        func fetchGames() {
            let  gamesCollection = Firestore.firestore().collection("games")
            gamesCollection.addSnapshotListener { querySnapshot, error in
                    if let error = error {
                        print("Error fetching documents: \(error)")
                        return
                    }

                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }

                    self.games = documents.compactMap { document in
                        do {
                            if let data = document.data() as? [String: Any] {
                                let jsonData = try JSONSerialization.data(withJSONObject: data)
                                let decoder = JSONDecoder()
                                let games = try decoder.decode(GameData.self, from: jsonData)
                                return games
                            } else {
                                return nil
                            }
                        } catch {
                            print("Error decoding bootcamp: \(error)")
                            return nil
                        }
                    }
                }
            }
        
//        func fetchGames() {
//            let  gamesCollection = Firestore.firestore().collection("games")
//            // Add a snapshot listener to the Firestore collection
//            gamesCollection.addSnapshotListener { querySnapshot, error in
//                if let error = error {
//                    print("Error fetching games: \(error.localizedDescription)")
//                    return
//                }
//                querySnapshot?.documentChanges.forEach { change in
//                    switch change.type {
//                    case .added:
//                        if let data = change.document.data() {
//                            let name = data["name"] as? String ?? ""
//                            let id = data["id"] as? String ?? ""
//                            //                        let images = data["images"]
//                            let about = data["about"] as? String ?? ""
//
//                            //                        let details = data["details"]
//                            // You can extract other fields here as needed
//                            //                        let game = GameData(id: UUID().uuidString, name: name, images: [], about: "", details: [])
//                            //                        self.games.append(game)
//                            //                        let game = GameData(id: id, name: name, images: [], about: about, details: [])
//                            //                                         self.games.append(game)
//                        }
//
//                    default:
//                        break
//                    }
//                }
//            }
//        }
//
//    }
}
