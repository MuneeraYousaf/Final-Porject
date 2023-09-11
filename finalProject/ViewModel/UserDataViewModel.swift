import SwiftUI
import FirebaseFirestore
import FirebaseAuth


class UserDataViewModel : ObservableObject {
    @Published var userss: UserModel = UserModel(username: "", image: "", phone: "", email: "")
    @Published var games: [GameData] = []
    @Published var favoriteGames: [GameData] = []
    @Published var comments: [Comment] = []
   
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
    func fetchUsers() {
        let currenUser = Auth.auth().currentUser?.email
        let email = "email"
        print("user Email in the fetch",currenUser!)
        Firestore.firestore()
            .collection("users")
            .whereField(email, isEqualTo: currenUser!)
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    print("Error fetching users: \(error.localizedDescription)")
                    return
                } else  {
                    for document in snapshot!.documents {
                        let data = document.data()
                        let username = data["username"]  as? String ?? ""
                        let image = data["image"] as? String ?? ""
                        let phone = data["phone"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        self.userss = UserModel(username: username, image: image, phone: phone, email: email)
                        print(self.userss)
                     
                    }
                }
                
            }
    }
    
    
    
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
            if let snapshot = querySnapshot {
                snapshot.documentChanges.forEach { change in
                    DispatchQueue.main.async {
                        let data = change.document.data()
                        let id = change.document.documentID
                        
                        if let name = data["name"] as? String,
                           let about = data["about"] as? String,
                           let detailsData = data["details"] as? [[String: Any]], // Assuming detailsData is an array of dictionaries
                           let stars = data["stars"] as? Int,
                           let age = data["age"] as? String,
                           let imagesData = data["images"] as? [[String: String]]{
                            
                            // Convert detailsData to an array of Detail objects
                            let details: [Detail] = detailsData.compactMap { detailDict in
                                guard let key = detailDict["key"] as? String,
                                      let values = detailDict["values"] as? [String] else {
                                    return nil
                                }
                                return Detail(key: key, values: values)
                            }
                            
                            
                            // Create a GameData instance with the retrieved data
                            let game = GameData(id: id, name: name, images: imagesData.map { imageDict in
                                let src = imageDict["src"] ?? ""
                                return images(src: src)
                            }, about: about, details: details, stars: stars, age: age)
                            
                            self.games.append(game)
                        }
                    }
                }
            }
        }
    }
    
    

    
    func addFavoriteGame(_ game: GameData) {
        if let currentUserEmail = Auth.auth().currentUser?.email {
            let userFavoritesCollection = Firestore.firestore().collection("users")
                .whereField("email", isEqualTo: currentUserEmail)
                .limit(to: 1) // Limit the query to 1 document (assuming emails are unique)

            userFavoritesCollection.getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error checking for duplicates: \(error)")
                } else {
                    guard let document = querySnapshot?.documents.first else {
                        print("User not found")
                        return
                    }

                    // Get the user document ID
                    let userDocumentID = document.documentID

                    // Reference to the "favorites" subcollection under the user document
                    let userFavoritesCollection = Firestore.firestore().collection("users").document(userDocumentID).collection("favorites")

                    // Check if the game already exists in the user's favorites
                    userFavoritesCollection.whereField("id", isEqualTo: game.id).getDocuments { (querySnapshot, error) in
                        if let error = error {
                            print("Error checking for duplicates: \(error)")
                        } else {
                            if let documents = querySnapshot?.documents, documents.isEmpty {
                                // No duplicate found, add the game to favorites
                                let gameData: [String: Any] = [
                                    "name": game.name,
                                    "images": game.images.map { image in
                                        return [
                                            "src": image.src
                                        ]
                                    },
                                    "about": game.about,
                                    "details": game.details.map { detail in
                                        return [
                                            "key": detail.key,
                                            // Add more detail properties here
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
                            } else {
                                // Duplicate found, handle accordingly (e.g., show an error message)
                                print("Duplicate game found. You can handle this case here.")
                            }
                        }
                    }
                }
            }
        }
    }


    func fetchFavoriteGames() {
        if let currentUserEmail = Auth.auth().currentUser?.email {
            let userFavoritesCollection = Firestore.firestore().collection("users")
                .whereField("email", isEqualTo: currentUserEmail)
                .limit(to: 1) // Limit the query to 1 document (assuming emails are unique)
            
            userFavoritesCollection.getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching user: \(error)")
                    return // Return early to prevent further execution in case of an error
                }
                
                guard let document = querySnapshot?.documents.first else {
                    print("User not found")
                    return
                }
                
                let userDocumentID = document.documentID
                let userFavoritesCollection = Firestore.firestore().collection("users").document(userDocumentID).collection("favorites")
                
                userFavoritesCollection.addSnapshotListener { querySnapshot, error in
                    if let error = error {
                        print("Error fetching favorite games: \(error)")
                        return // Return early to prevent further execution in case of an error
                    }
                    
                    var favoriteGames: [GameData] = []
                    
                    for document in querySnapshot?.documents ?? [] {
                        let data = document.data()
                        let id = document.documentID
                        // Extract the required fields from the data dictionary
                        if let name = data["name"] as? String,
                           let about = data["about"] as? String,
                           let stars = data["stars"] as? Int,
                           let age = data["age"] as? String {
                            
                            // Create a GameData instance manually
                            let game = GameData(id: id, name: name, images:[] , about: about, details: [], stars: stars, age: age)
                            
                            favoriteGames.append(game)
                        }
                    }
                    favoriteGames = self.removeDuplicates(from: favoriteGames)
                    // Update the @State property here
                    DispatchQueue.main.async {
                        self.favoriteGames = favoriteGames
                        //                    print(favoriteGames)
                    }
                }
            }
        }
    }


    func removeDuplicates(from games: [GameData]) -> [GameData] {
        var uniqueGames = [GameData]()
        
        for game in games {
            if !uniqueGames.contains(where: { $0.id == game.id }) {
                uniqueGames.append(game)
            }
        }
        
        return uniqueGames
    }
    
    func deleteFavoriteGame(_ game: GameData) {
     
        if let user = Auth.auth().currentUser {
            print("User ID: \(user.uid)") // Debug: Print user ID
            
            let userFavoritesCollection = Firestore.firestore().collection("users").document(user.uid).collection("favorites")
            
            let gameDocRef = userFavoritesCollection.document(game.id)
            print("game id =", game.id)
            gameDocRef.delete { error in
                if let error = error {
                    print("Error deleting game: \(error)")
                } else {
                    print("Game deleted successfully!")
                    
                    // Remove the deleted game from the local favoriteGames array
                    if let index = self.favoriteGames.firstIndex(where: { $0.name == game.name }) {
                        self.favoriteGames.remove(at: index)
                        print("Game removed from local array.")
                    } else {
                        print("Game not found in local array.")
                    }
                }
            }
        } else {
            print("User is not authenticated")
        }
    }
    
    func addComment(_ comment: Comment) {
        let db = Firestore.firestore()
        
        db.collection("comments").addDocument(data: [
            "userID": comment.userID,
            "gameID": comment.gameID,
            "text": comment.text,
            "rating": comment.rating
        ]) { error in
            if let error = error {
                print("Error adding comment: \(error)")
            } else {
                print("Comment added successfully!")
            }
        }
    }
    
    
    
    
    
}


