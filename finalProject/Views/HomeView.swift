
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

//            VStack{
//                VStack{
//
//                    Image("logo")
//
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 60, height: 40, alignment: .center)
//                        .padding(-5)
//                    Text("Games Vault")
//                        .font(
//                            .custom(
//                                "SairaSemiCondensed-SemiBold",
//                                fixedSize: 20)
//                            .weight(.medium)
//                        )
//
//                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514)).padding(-10)
//
//                }
//                .padding(10)
//
//                // MARK: Search Text Field
//                VStack{
//                    TextField("Text search", text: $searchText)
//                        .padding()
//                        .frame(height:40)
//                        .background(Color(white: 0.97))
//                        .cornerRadius(16)
//
//                }.padding(.horizontal)
//                HStack{
//                    Text("Text categories")
//                        .foregroundColor(.gray)
//                    Picker("Select Category", selection: $selectedCatregryIndex) {
//                        ForEach(0..<categoryRanges.count, id: \.self) { index in
//                            Text(categoryRanges[index])
//                        }
//                    }
//                    .pickerStyle(.menu)
//                    .accentColor(.black)
//                    Text("Text Platforms")
//                        .foregroundColor(.gray)
//                    Picker("Select Age", selection: $selectedAgeIndex) {
//                        ForEach(0..<ageRanges.count, id: \.self) { index in
//                            Text(ageRanges[index])
//                        }
//                    }
//                    .pickerStyle(.menu)
//                    .accentColor(.black)
//
//                }
//                .padding(2)
        ZStack {
            BackgroundView()
            VStack{
                VStack{
                    
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
                    
                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514)).padding(-10)
                    
                }
                .padding(10)
                
                // MARK: Search Text Field
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
                    Picker("Select Category", selection: $selectedCatregryIndex) {
                        ForEach(0..<categoryRanges.count, id: \.self) { index in
                            Text(categoryRanges[index])
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    //                Spacer()
                    Text("Text Platforms")
                        .foregroundColor(.gray)
                    Picker("Select Age", selection: $selectedAgeIndex) {
                        ForEach(0..<ageRanges.count, id: \.self) { index in
                            Text(ageRanges[index])
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    
                }.padding(.horizontal)
                //                .foregroundColor(.clear)
                ScrollView(showsIndicators:false){
                    ForEach(filteredGames, id: \.id) { game in
                        NavigationLink(
                            destination: {
                                DetailsGameView(game: game)
                            }, label: {
                                GameView(game: game).frame(width: 360, height: 200)
                                
                            }
                        )
                    }
                    Rectangle()
                        .frame(height: 100)
                        .foregroundColor(.clear)
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
                    //MARK:
                    if selectedCatregryIndex != 0 {
                        let selectedAge = categoryRanges[selectedCatregryIndex]
                        filteredGames = filteredGames.filter { game in
                            if let topicsDetail = game.details.first(where: { $0.key == "Topics" }) {
                                let values = topicsDetail.values as? [String] ?? []
                                // Iterate over the values array and check if any of them match the selected age
                                return values.contains { $0.lowercased() == selectedAge.lowercased() }
                            } else {
                                // Handle the case where "Topics" detail is not found
                                return false // Or handle it as needed
                            }
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
//            }
//            .fullScreenCover(isPresented: $show, content: DetailsGameView.init)
        }

    
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView().environmentObject(UserDataViewModel())
    }
}




