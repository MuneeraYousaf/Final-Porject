//
//  test.swift
//  finalProject
//
//  Created by Muneera Y on 19/02/1445 AH.
//


import SwiftUI
import Firebase

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



struct FavoritesView: View {
    @EnvironmentObject var userData: UserDataViewModel

    var body: some View {
        List(userData.favoriteGames, id: \.id) { game in
            Text(game.name)
            Button( action: {
                userData.deleteFavoriteGame(game)
                   },label:  {
                       Text("Delete")
                           .foregroundColor(.red)
                   })
        }
        .onAppear {
            fetchFavoriteGames()
        }
    }

    func fetchFavoriteGames() {
        userData.fetchFavoriteGames()
    }
    
   

}
struct AddCommentView: View {
    @State private var commentText = ""
    @State private var userRating = 0
    @EnvironmentObject var userDataViewModel: UserDataViewModel
    var body: some View {
        VStack {
            TextField("Add a comment", text: $commentText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Rate the game:")
            RatingViews(rating: $userRating)
                .padding()

            Button("Add Comment") {
                // Handle adding the comment and rating to Firestore
                let newComment = Comment(userID: "V3ecxeslnCBp2kQGoHHp", gameID: "1W49qMfKSrHouwomRqAS", text: commentText, rating: userRating)
                userDataViewModel.addComment(newComment)

                // Clear the comment input and rating
                commentText = ""
                userRating = 0
            }
            .padding()
        }
    }
}




    

