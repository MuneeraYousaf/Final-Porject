////
////  ContentView.swift
////  finalProject
////
////  Created by Muneera Y on 13/02/1445 AH.
////
//
//import SwiftUI
//import Firebase
//import FirebaseStorage
////
//struct RootView: View {
//
//    var body: some View {
//        VStack {
//
//        }
//        //
//        .onAppear(){
//            //            //this is for convert json to codable (swift format)
//            //            if let content = try? String(contentsOf: Bundle.main.url(forResource: "gamesv2",
//            //                                                                     withExtension: "json")!, encoding: .utf8)
//            //            {
//            //                if let data = content.data(using: String.Encoding.utf8) {
//            //                    do {
//            //                        let decoder = JSONDecoder ( )
//            //                        let gameData = try decoder.decode(Array<GameData>.self, from: data)
//            //                        print (gameData)
//            ////                        uploadDataToFirestore(gameData)
//            //                    }
//            //                    catch {
//            //                        print(error)
//            //                    }
//            //
//            //                }
//            //            }
//                       let storage = Storage.storage()
//
//            // Read and parse the JSON file (replace with your own JSON file path)
//            if let jsonPath = Bundle.main.path(forResource: "gamesv2", ofType: "json"),
//               let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)),
//               let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
//               let imagesArray = jsonObject["images"] as? [[String: String]] {
//
//                // Iterate through the images array
//                for imageInfo in imagesArray {
//                    if let imageURL = imageInfo["src"],
//                       let url = URL(string: imageURL) {
//
//                        // Get a reference to the image in Firebase Storage
//                        let storageRef = storage.reference()
//                        let imageRef = storageRef.child("images/\(UUID().uuidString).jpg") // Replace with your desired storage path
//
//                        // Download the image data from the remote URL
//                        if let imageData = try? Data(contentsOf: url) {
//
//                            // Upload the image data to Firebase Storage
//                            imageRef.putData(imageData, metadata: nil) { _, error in
//                                if let error = error {
//                                    print("Error uploading image: \(error.localizedDescription)")
//                                } else {
//                                    print("Image uploaded successfully to Firebase Storage")
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//
//        }
//    }
//
//}
//
////        }
////        //    }
////    }
////        func uploadDataToFirestore(_ data: [GameData]) {
//            // Reference the Firestore collection "games".
//            let gamesCollection = Firestore.firestore().collection("games")
//
//            // Use a loop to add each GameData as a separate document.
//            for game in data {
//                do {
//                    // Convert the GameData struct to a dictionary manually.
//                    var gameDataDictionary: [String: Any] = [
//                        "id": game.id,
//                        "name": game.name,
//                        "about": game.about,
//                        "age": game.age,
//                        "stars": game.stars,
//                        "details": game.details.map { detail in
//                            return [
//                                "key": detail.key,
//                                "values": detail.values.map { value in
//                                    switch value {
//                                    case .string(let stringValue):
//                                        return stringValue
//                                    case .stringArray(let stringArrayValue):
//                                        return stringArrayValue.joined(separator: ", ") // Join array of strings
//                                    }
//                                }
//                            ]
//                        },
//                        "images": game.images.map { image in
//                            return [
//                                "src": image.src
//                            ]
//                        }
//                        // Add other fields here as needed
//                    ]
//
//                    // Add the document to the "games" collection.
//                    gamesCollection.addDocument(data: gameDataDictionary) { error in
//                        if let error = error {
//                            print("Error adding game document: \(error)")
//                        } else {
//                            print("Game document added successfully!")
//                        }
//                    }
//                } catch {
//                    print("Error converting GameData to dictionary: \(error)")
//                }
//            }
//        }
////
//    
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}

//import Firebase
//import FirebaseStorage
//
//// Initialize Firebase
////FirebaseApp.configure()
//
//// Get a reference to Firebase Storage
//
//}
import SwiftUI
import Firebase
import FirebaseStorage
//
//struct RootView: View {
//    @State private var gameData: [GameData] = []
//    
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 20) {
//                
//            }
//            .onAppear {
//                // Initialize Firebase
//                //            FirebaseApp.configure()
//                
//                // Load and parse the JSON data
//                if let jsonPath = Bundle.main.path(forResource: "gamesv2", ofType: "json"),
//                   let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) {
//                    
//                    let decoder = JSONDecoder()
//                    if let parsedGameData = try? decoder.decode([GameData].self, from: jsonData) {
//                        gameData = parsedGameData
//                        
//                        // Initialize Firebase Storage
//                        let storage = Storage.storage()
//                        let storageRef = storage.reference()
//                        
//                        // Upload images to Firebase Storage
//                        for game in gameData {
//                            if let imageURL = URL(string: game.images.first!.src) {
//                                let imageRef = storageRef.child("images/\(UUID().uuidString).jpg")
//                                
//                                URLSession.shared.dataTask(with: imageURL) { data, _, error in
//                                    if let error = error {
//                                        print("Error downloading image: \(error.localizedDescription)")
//                                    } else if let imageData = data {
//                                        imageRef.putData(imageData, metadata: nil) { _, error in
//                                            if let error = error {
//                                                print("Error uploading image: \(error.localizedDescription)")
//                                            } else {
//                                                print("Image uploaded successfully to Firebase Storage")
//                                            }
//                                        }
//                                    }
//                                }.resume()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        RootView()
////    }
////}
//
//
//
