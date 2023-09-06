////
////  test.swift
////  finalProject
////
////  Created by Muneera Y on 19/02/1445 AH.
////
//
//import SwiftUI
//
//import Firebase
//
//
//import FirebaseFirestore
//
//struct GamesListView: View {
//    var filteredGames: [GameData] = []
//    @State private var selectedAgeIndex = 0
//    let ageRanges = ["All", "13+", "18+", "10+"]
//    @State private var searchText = ""
//    @EnvironmentObject var gamesData: UserDataViewModel
//
//    var body: some View {
//        VStack{
//            Picker("Select Age", selection: $selectedAgeIndex) {
//                ForEach(0..<ageRanges.count, id: \.self) { index in
//                    Text(ageRanges[index])
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding()
//
//            List {
//                TextField("Search by game name", text: $searchText)
//
//                ForEach(filteredGames, id: \.id) { game in
//                    Text(game.name)
//                }
//            }
//            .onAppear {
//                gamesData.fetchGames()
//            }
//        }
//    }
//
//        var filteredGames: [GameData] {
//            if searchText.isEmpty {
//                return gamesData.games
//            } else {
//                return gamesData.games.filter { game in
//                    return game.name.lowercased().contains(searchText.lowercased())
//                }
//            }
//        }
//    var filteredGames: [GameData] {
//        if selectedAgeIndex == 0 {
//            return gamesData.games // Show all games
//        } else {
//            // Filter games by age range based on selectedAgeIndex
//            let selectedAge = ageRanges[selectedAgeIndex]
//            return gamesData.games.filter { game in
//                return game.age.lowercased() == selectedAge.lowercased()
//            }
//        }
//    }
//}
//

import SwiftUI

struct GamesListView: View {
    @State private var selectedAgeIndex = 0
    let ageRanges = ["All", "13+", "18+", "10+"]
    @State private var searchText = ""
    @EnvironmentObject var gamesData: UserDataViewModel
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Picker("Select Age", selection: $selectedAgeIndex) {
                    ForEach(0..<ageRanges.count, id: \.self) { index in
                        Text(ageRanges[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                TextField("Search by game name", text: $searchText)
                    .padding()
                
                List {
                    NavigationLink(destination: FavoritesView()) {
                        Text("View Favorite Games")
                    }
                    ForEach(filteredGames, id: \.id) { game in
                        Text(game.name)
                        Button(action: {
                            // Call the addFavoriteGame function to add the game to favorites
                            gamesData.addFavoriteGame(game)
                        }) {
                            Text("Add to Favorites")
                        }
                    }
                    
                    
                    
                    //                ForEach(filteredGames, id: \.id) { game in
                    //                    Text(game.name)
                    //                }
                }
                .onAppear {
                    gamesData.fetchGames()
                }
            }
        }
        
        var filteredGames: [GameData] {
            var filteredGames = gamesData.games
            
            // Apply age-based filtering
            if selectedAgeIndex != 0 {
                let selectedAge = ageRanges[selectedAgeIndex]
                filteredGames = filteredGames.filter { game in
                    return game.age.lowercased() == selectedAge.lowercased()
                }
            }
            
            // Apply search-based filtering
            if !searchText.isEmpty {
                filteredGames = filteredGames.filter { game in
                    return game.name.lowercased().contains(searchText.lowercased())
                }
            }
            
            return filteredGames
        }
    }
    
}

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var userData: UserDataViewModel
    @State private var favoriteGames: [GameData] = []

    var body: some View {
        
        List(favoriteGames, id: \.id) { game in
            Text(game.name)
        }
        .onAppear {
            fetchFavoriteGames()
        }
    }

    func fetchFavoriteGames() {
        userData.fetchFavoriteGames { favoriteGames in
            self.favoriteGames = favoriteGames
        }
    }
}
