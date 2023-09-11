////
////  ContentView.swift
////  finalProject
////
////  Created by Muneera Y on 13/02/1445 AH.
////
//
//import SwiftUI
//import Firebase
//
//
//struct RootView: View {
//   
//    var body: some View {
//        VStack {
//            
//        }
//        
//        .onAppear(){
//            //this is for convert json to codable (swift format)
//            if let content = try? String(contentsOf: Bundle.main.url(forResource: "gamesv2",
//                                                                     withExtension: "json")!, encoding: .utf8)
//            {
//                if let data = content.data(using: String.Encoding.utf8) {
//                    do {
//                        let decoder = JSONDecoder ( )
//                        let gameData = try decoder.decode(Array<GameData>.self, from: data)
//                        print (gameData)
////                        uploadDataToFirestore(gameData)
//                    }
//                    catch {
//                        print(error)
//                    }
//                    
//                }
//            }
//            
//        }
//        //    }
//    }
//        func uploadDataToFirestore(_ data: [GameData]) {
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
//
