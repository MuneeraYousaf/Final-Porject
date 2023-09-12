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
                        if game.images.indices.contains(1) {
                            // Check if the array contains an element at index 1
                            AsyncImage(url: URL(string: game.images[1].src)) { image in
                                image
                                    .resizable()
                                    .frame(width: 180, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 180, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        } else {
                            // Handle the case when index 1 is out of range
                            Text("Image not available")
                        }
                            VStack(alignment: .leading) {
                    
                                Text(game.name)
                                    .font(.system(size: 20))
                                    .bold()
                                    .padding(2)
                                    .frame(maxWidth: .infinity,alignment: .leading)

                                    .multilineTextAlignment(.leading)
                                HStack {
                                    Text(Double(game.stars).description)
                                        .font(.system(size: 15))
                                    RatingView(rating: .constant(game.stars))
                                        .font(.system(size: 15))
                                }
                                .padding(.top)
                                
                                Text(game.age)
                                
                                if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                                    HStack {
                                        Text(releaseDateDetail.values.joined(separator: ", "))
                                            .font(.footnote)
                                    }
                                }
                                
                            }
                           
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
                        }.frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        
                            .padding(.vertical, -100)

                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            
                }

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
