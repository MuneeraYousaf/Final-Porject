import SwiftUI

struct GameView: View {
    var game: GameData
    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(white: 0.97))
                        .frame(width: 360, height: 200)
                        .cornerRadius(16)
                    
                    HStack {
                        VStack(spacing: 4) {
                            Image("Game 1")
                                .resizable()
                                .frame(width: 180, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .font(.system(size: 20))
                                .bold()
                                .padding(2)
                                .frame(width: 110)
                            HStack {
//                                Text("4.0")
//                                    .font(.system(size: 9))
                                RatingView(rating: .constant(game.stars))
                                    .font(.system(size: 9))
                            }
                            .padding(2)
                            Text(game.age)
                                .padding(2)
                            
                            if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                                HStack {
                                    Text(releaseDateDetail.values.joined(separator: ", "))
                                        .font(.footnote)
                                }
                            }
                        }
                        .padding(2)
                        
                        Button(action: {
                            gamesData.addFavoriteGame(game)
                        }) {
                            Text("+")
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
                                .cornerRadius(16)
                        }
                        
                    }
                }.frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var game: GameData = GameData(id: "", name: "", images: [], about: "", details: [], stars: 0, age: "")

    static var previews: some View {
        GameView(game: game)
    }
}
