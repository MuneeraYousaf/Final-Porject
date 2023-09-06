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
import FirebaseAuth


class UserDataViewModel : ObservableObject {
    @Published var users: [UserModel] = []
    @Published var games: [GameData] = []
    
    //MARK: Add user to firebase
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
        // Create a reference to the Firestore "games" collection
        let gamesCollection = Firestore.firestore().collection("games")
        
        // Add a snapshot listener to the collection to listen for changes
        gamesCollection.addSnapshotListener { querySnapshot, error in
            if let error = error {
                // Handle and print any errors that occur during the fetch
                print("Error fetching documents: \(error)")
                return
            }

            // Check if there are any documents in the query snapshot
            guard let documents = querySnapshot?.documents else {
                // If there are no documents, print a message and return
                print("No documents")
                return
            }

            // Use compactMap to process each document in the snapshot
            self.games = documents.compactMap { document in
                do {
                    // Try to extract the document data as a dictionary
                    if let data = document.data() as? [String: Any] {
                        // Convert the dictionary data to JSON data
                        let jsonData = try JSONSerialization.data(withJSONObject: data)
                        
                        // Create a JSON decoder
                        let decoder = JSONDecoder()
                        
                        // Attempt to decode the JSON data into a GameData object
                        let game = try decoder.decode(GameData.self, from: jsonData)
                        
                        // Return the decoded GameData object
                        return game
                    } else {
                        // If data couldn't be extracted or decoded, return nil
                        return nil
                    }
                } catch {
                    // Handle any errors that occur during decoding and print an error message
                    print("Error decoding game data: \(error)")
                    return nil
                }
            }
        }
    }
//    func addFavoriteGame(_ game: GameData) {
//            if let user = Auth.auth().currentUser {
//                let userFavoritesCollection = Firestore.firestore().collection("users").document(user.uid).collection("favorites")
//
//                // Convert the game data to a dictionary
//                let gameData: [String: Any] = [
//                    "id": game.id,
//                    "name": game.name,
//                    // Add other game properties as needed
//                ]
//
//                // Add the game data to the "favorites" collection
//                userFavoritesCollection.addDocument(data: gameData) { error in
//                    if let error = error {
//                        print("Error adding favorite game: \(error)")
//                    } else {
//                        print("Favorite game added successfully!")
//                    }
//                }
//            }
//        }
    func addFavoriteGame(_ game: GameData) {
        if let user = Auth.auth().currentUser {
            let userFavoritesCollection = Firestore.firestore().collection("users").document(user.uid).collection("favorites")

            // Convert the game data to a dictionary
            let gameData: [String: Any] = [
                "id": game.id,
                "name": game.name,
                "images": game.images.map { image in
                    return [
                        "src": image.src
                    ]
                },
                "about": game.about,
                "details": game.details.map { detail in
                    return [
                        "key": detail.key ?? "",
                        "values": detail.values.map { value in
                            switch value {
                            case .string(let stringValue):
                                return stringValue
                            case .stringArray(let stringArrayValue):
                                return stringArrayValue.joined(separator: ", ") // Join array elements into a single string
                            }
                        }

                    ]
                },
                "stars": game.stars,
                "age": game.age
                // Add other game properties here
            ]

            // Add the game data to the "favorites" collection
            userFavoritesCollection.addDocument(data: gameData) { error in
                if let error = error {
                    print("Error adding favorite game: \(error)")
                } else {
                    print("Favorite game added successfully!")
                }
            }
        }
    }

    
    func fetchFavoriteGames(completion: @escaping ([GameData]) -> Void) {
        if let user = Auth.auth().currentUser {
            let userFavoritesCollection = Firestore.firestore().collection("users").document(user.uid).collection("favorites")

            userFavoritesCollection.getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error fetching favorite games: \(error)")
                    completion([])
                } else {
                    var favoriteGames: [GameData] = []
                    for document in querySnapshot?.documents ?? [] {
                        let data = document.data()
                        
                        // Extract the required fields from the data dictionary
                        if let id = data["id"] as? String,
                           let name = data["name"] as? String,
                           let about = data["about"] as? String,
                           let images = data["images"] as? [[String: String]],
                           let details = data["details"] as? [[String: Any]] ,
                           let stars = data["stars"] as? Int,
                        let age = data["age"]as? String{
                            
                            // Create a GameData instance manually
                            let game = GameData(id: id, name: name, images: images.map { Image(src: $0["src"] ?? "") }, about: about, details: [],stars: stars, age: age)
                            
                            favoriteGames.append(game)
                        }
                    }
                    completion(favoriteGames)
                }
            }
        } else {
            completion([])
        }
    }


}
