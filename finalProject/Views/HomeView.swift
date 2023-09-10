////
////  HomeView.swift
////  finalProject
////
////  Created by Sarah on 04/09/2023.
////
//
import SwiftUI

struct HomeView: View {
    @State var  searchText :String = ""
    @State var gametype : GameType = .all
    @State var platforms : PlatForm = .Xbox
    @State private var selectedAgeIndex = 0
    @State private var selectedCatregryIndex = 0
    @State var show = false
    let ageRanges = ["All", "13+", "18+", "10+"]
    let categoryRanges = ["All", "Fantasy", "Adventures", "Robots", "Monsters"]

    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
//        GeometryReader {geometry in
            VStack{
                VStack{
                    //                Image(systemName: "line.3.horizontal")
//                    Spacer()
//                    Text("Games Vault")
                    Image("logo")
                        
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 40, alignment: .center)
                        .padding(-5)
                    Text("Games Vault")
                        .font(
                             .custom(
                             "SairaSemiCondensed-SemiBold",
                             fixedSize: 20)
                             .weight(.medium)
)
//                         )
                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514)).padding(-10)
//                    Spacer()
//                    AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person"))
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .cornerRadius(16)
                }
                .padding(10)

//                HStack{
//                    Image(systemName: "magnifyingglass")
//                    TextField("Search Game..", text: $searchedText)
//                }
//                .padding()
//
//                .background(RoundedRectangle(cornerRadius: 12.5)
//                    .fill(.gray.opacity(0.25)))
//                .padding(.horizontal)
                // Search Text Field
                VStack{
                    TextField("Text search", text: $searchText)
                        .padding()
                        .frame(height:40)
                        .background(Color(white: 0.97))
                        .cornerRadius(16)
                        
                }.padding(.horizontal)
                HStack{
                    Text("Text categories")
                        .foregroundColor(.gray)
//                    Picker("", selection: $gametype) {
//                        Text("Text all")
//                            .tag(GameType.all)
//                        Text("Text action")
//                            .tag(GameType.action)
//                        Text("Text adventure")
//                            .tag(GameType.adventure)
//                        Text("Text sports")
//                            .tag(GameType.sports)
//                    }
                    Picker("Select Category", selection: $selectedCatregryIndex) {
                        ForEach(0..<categoryRanges.count, id: \.self) { index in
                            Text(categoryRanges[index])
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    Text("Text Platforms")
                        .foregroundColor(.gray)

//                    Picker("", selection: $platforms) {
//                        Text("Text PlayStation")
//                            .tag(PlatForm.PlayStation)
//                        Text("Text NintendoSwitch")
//                            .tag(PlatForm.NintendoSwitch)
//                        Text("Text Windows")
//                            .tag(PlatForm.Windows)
//                        Text("Text Xbox")
//                            .tag(PlatForm.Xbox)
//                    }
                    Picker("Select Age", selection: $selectedAgeIndex) {
                        ForEach(0..<ageRanges.count, id: \.self) { index in
                            Text(ageRanges[index])
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)

                }

                ScrollView(showsIndicators:false){
                    ForEach(filteredGames, id: \.id) { game in
                        NavigationLink(
                            destination: {
                                DetailsGameView(game: game)
                            }, label: {
                                GameView(game: game).frame(width: .infinity, height: 200)}
                        )
                    }
                    }

//                                    ZStack {
//                                        if !show {
//
//                                            GameView()
////                                                .padding()
//
//                                        } else {
//                                            DetailsGameView()
//                                    .padding()
//                                .transition(.move(edge: .trailing))
//                                .zIndex(1)
////                                                .fullScreenCover(isPresented: $show, content: DetailsGameView.init)
////                                                .navigationBarBackButtonHidden(true)
//                                    
//                                        }
//                                    }
//                                    .onTapGesture {
//                                        withAnimation(.spring()) {
//                                            show.toggle()
//                                        }
                                    }
//                } .onAppear(){
//                    gamesData.fetchGames()
//                }
        var filteredGames: [GameData] {
            var filteredGames = gamesData.games
            
            // Apply age-based filtering
            if selectedAgeIndex != 0 {
                let selectedAge = ageRanges[selectedAgeIndex]
                filteredGames = filteredGames.filter { game in
                    return game.age.lowercased() == selectedAge.lowercased()
                }
            }
            //MARK:
//            if selectedCatregryIndex != 0 {
//                let selectedAge = categoryRanges[selectedCatregryIndex]
//                filteredGames = filteredGames.filter { game in
//                    return game.details.first(where: { $0.key == "Release date" }).lowercased() == selectedAge.lowercased()
//                }
//            }
            
            // Apply search-based filtering
            if !searchText.isEmpty {
                filteredGames = filteredGames.filter { game in
                    return game.name.lowercased().contains(searchText.lowercased())
                }
            }
            
            return filteredGames
        }
        }
//            }
//            .fullScreenCover(isPresented: $show, content: DetailsGameView.init)
//        }

    
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView().environmentObject(UserDataViewModel())
    }
}




