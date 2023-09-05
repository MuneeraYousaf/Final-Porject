//
//  test.swift
//  finalProject
//
//  Created by Muneera Y on 19/02/1445 AH.
//

import SwiftUI

import Firebase


import FirebaseFirestore

struct GamesListView: View {
    @State private var games: [GameData] = []
    @EnvironmentObject var gamesData : UserDataViewModel

    var body: some View {
        List(gamesData.games, id: \.id) { game in
            Text(game.name)
        }
        .onAppear {
            gamesData.fetchGames()
        }
    }

    
}

