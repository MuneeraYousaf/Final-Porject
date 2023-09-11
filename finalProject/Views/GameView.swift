import SwiftUI

struct GameView: View {
    var game: GameData
    @EnvironmentObject var gamesData: UserDataViewModel
    @State private var isFavorite = false
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(white: 0.97))
                        .frame(width: 360, height: 200)
                        .cornerRadius(16)
                    
                    HStack {
                      Image("Game 1")
                                .resizable()
                                .frame(width: 180, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .font(.system(size: 20))
                                .bold()
                                .padding(2)
                                .frame(maxWidth: .infinity,alignment: .leading)
//                                .background(Color.red)
                                .multilineTextAlignment(.leading)
                            HStack {
                                Text(Double(game.stars).description)
                                    .font(.system(size: 15))
                                RatingView(rating: .constant(game.stars))
                                    .font(.system(size: 15))
                            }
                            .padding(.top)
                            Text(game.age)
//                                .padding(2)
                            
                            if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                                HStack {
                                    Text(releaseDateDetail.values.joined(separator: ", "))
                                        .font(.footnote)
                                }
                            }
                        }
//                        .padding(2)
                        
                        
                    }
//                    .background(.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                

//                        VStack {
                    Button(action: {
                                           if !isFavorite {
                                               gamesData.addFavoriteGame(game)
                                           }
                                           isFavorite.toggle()
                                       }) {
                                Image(systemName: "heart")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
                                    .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
                                    .cornerRadius(16)
                            } 
//                            Spacer()
//                        }
                                     
                        
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .background(.red)
                }
//                .background(.red)
                
//                .frame(maxWidth: .infinity, alignment: .top)
//                .frame(maxWidth: .infinity, alignment: .trailing)
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
