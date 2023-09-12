import SwiftUI

//struct GameView: View {
//    var game: GameData
//    @EnvironmentObject var gamesData: UserDataViewModel
//    @State private var isFavorite = false
//    var body: some View {
//        VStack {
//            GeometryReader { geometry in
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(Color(white: 0.97))
//                        .frame(width: 360, height: 200)
//                        .cornerRadius(16)
//
//                    HStack {
//                        if game.images.indices.contains(1) {
//                            // Check if the array contains an element at index 1
//                            AsyncImage(url: URL(string: game.images[1].src)) { image in
//                                image
//                                    .resizable()
//                                    .frame(width: 180, height: 200)
//                                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                            } placeholder: {
//                                ProgressView()
//                                    .frame(width: 180, height: 200)
//                                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                            }
//                        } else {
//                            // Handle the case when index 1 is out of range
//                            Text("Image not available")
//                        }
//                            VStack(alignment: .leading) {
//
//                                Text(game.name)
//                                    .font(.system(size: 20))
//                                    .bold()
//                                    .padding(2)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .multilineTextAlignment(.leading)
//                                HStack {
//                                    Text(Double(game.stars).description)
//                                        .font(.system(size: 15))
//                                    RatingView(rating: .constant(game.stars))
//                                        .font(.system(size: 15))
//                                }
//                                .padding(.top)
//
//                                Text(game.age)
//
//                                if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
//                                    HStack {
//                                        Text(releaseDateDetail.values.joined(separator: ", "))
//                                            .font(.footnote)
//                                    }
//                                }
//
//                            }
//
//                        Button(action: {
//
//                                gamesData.addFavoriteGame(game)
//                        }) {
//                            Image(systemName: "heart")
//                                .frame(width: 30, height: 30)
//                                .foregroundColor(.white)
//                                .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
//                                .overlay(RoundedRectangle(cornerRadius: 16)
//                                    .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
//                                .cornerRadius(16)
//                        }.frame(maxWidth: .infinity, alignment: .bottomTrailing)
//
//                            .padding(.vertical, -100)
//
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//                }
//
//                .padding(.horizontal)
//            }
//        }
//    }
//}
//struct GameView: View {
//    var game: GameData
//    @EnvironmentObject var gamesData: UserDataViewModel
//    @State private var isFavorite = false
//    @State private var buttonScale: CGFloat = 1.0 // Added for button animation
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Rectangle()
//                    .foregroundColor(Color(white: 0.97))
//                    .frame(width: 360, height: 200)
//                    .cornerRadius(16)
//                    .shadow(radius: 2)
//
//                HStack {
//                    if game.images.indices.contains(1) {
//                        AsyncImage(url: URL(string: game.images[1].src)) { image in
//                            image
//                                .resizable()
//                                .frame(width: 180, height: 200)
//                                .clipShape(RoundedRectangle(cornerRadius: 16))
//                                .shadow(radius: 2)
//                        } placeholder: {
//                            ProgressView()
//                                .frame(width: 180, height: 200)
//                                .clipShape(RoundedRectangle(cornerRadius: 16))
//                                .shadow(radius: 2)
//                        }
//                    } else {
//                        Text("Image not available")
//                    }
//
//                    VStack(alignment: .leading) {
//                        Text(game.name)
//                            .font(.title)
//                            .bold()
//                            .padding(.bottom, 4)
//
//                        HStack {
//                            Text(String(format: "%.1f", game.stars))
//                                .font(.subheadline)
//                            RatingView(rating: .constant(game.stars))
//                                .font(.subheadline)
//                        }
//
//                        Text(game.age)
//                            .font(.subheadline)
//
//                        if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
//                            Text("Release Date:")
//                                .font(.subheadline)
//                            Text(releaseDateDetail.values.joined(separator: ", "))
//                                .font(.subheadline)
//                        }
//                    }
//                    .padding(.horizontal)
//
//                    Spacer()
//
//                    Button(action: {
//                        withAnimation {
//                            isFavorite.toggle()
//                            buttonScale = isFavorite ? 1.2 : 1.0
//                        }
//                    }) {
//                        Image(systemName: isFavorite ? "heart.fill" : "heart")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.white)
//                            .background(isFavorite ? Color.red : Color.blue)
//                            .clipShape(Circle())
//                            .shadow(radius: 2)
//                    }
//                    .padding(.trailing, 12)
//                    .scaleEffect(buttonScale) // Apply scale effect based on buttonScale
//                }
////                .padding()
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct GameView: View {
//    var game: GameData
//    @EnvironmentObject var gamesData: UserDataViewModel
//    @State private var isFavorite = false
//    @State private var buttonScale: CGFloat = 1.0 // Added for button animation
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack(alignment: .leading, spacing: 8) {
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(Color(white: 0.97))
//                        .frame(width: 360,height: 200)
//                        .cornerRadius(16)
//                        .shadow(radius: 2)
//
//                    HStack(alignment: .top) {
//                        if game.images.indices.contains(1) {
//                            AsyncImage(url: URL(string: game.images[1].src)) { image in
//                                image
//                                    .resizable()
//                                    .frame(width: 180, height: 200)
//                                    .cornerRadius(12)
//                                    .shadow(radius: 2)
//                            } placeholder: {
//                                ProgressView()
//                                    .frame(width: 180, height: 200)
//                                    .cornerRadius(12)
//                                    .shadow(radius: 2)
//                            }
//                        } else {
//                            Text("Image not available")
//                                .foregroundColor(.gray)
//                        }
//
//                        VStack(alignment: .leading) {
//                            Text(game.name)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .multilineTextAlignment(.leading)
//                                .font(.title)
//                                .bold()
//
//                            HStack {
//                                Text(String(format: "%.1f", game.stars)).foregroundColor(.red)
//                                    .font(.subheadline)
//                                RatingView(rating: .constant(game.stars))
//                                    .font(.subheadline)
//                            }
//
//                            Text(game.age)
//                                .font(.subheadline)
//
//                            if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
//                                Text("Release Date:")
//                                    .font(.subheadline)
//                                Text(releaseDateDetail.values.joined(separator: ", "))
//                                    .font(.subheadline)
//                            }
//                        }
//                        .padding(.leading, 8)
//
//                        Spacer()
//
//                        Button(action: {
//                            withAnimation {
//                                isFavorite.toggle()
//                                buttonScale = isFavorite ? 1.2 : 1.0
//                                if isFavorite {
//                                    gamesData.addFavoriteGame(game)
//                                } else {
//                                    gamesData.deleteFavoriteGame(game)
//                                }
//                            }
//                        }) {
//                            Image(systemName: isFavorite ? "heart.fill" : "heart")
//                                .frame(width: 30, height: 30)
//                                .foregroundColor(.white)
//                                .background(isFavorite ? Color.red : Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
//                                .overlay(RoundedRectangle(cornerRadius: 16)
//                                    .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
//                                .cornerRadius(16)
//                            //                            .resizable()
//                            //                            .frame(width: 28, height: 28) // Adjust the size to fit inside the circle
//                            //                            .foregroundColor(.white)
//                            //                            .background(isFavorite ? Color.red : Color.blue)
//                            //                            .overlay(
//                            //                                Circle() // Create a circular overlay
//                            //                                    .stroke(Color.clear, lineWidth: 4) // Adjust the circle's stroke if needed
//                            //                            )
//                                .clipShape(Circle())
//                                .shadow(radius: 2)
//                        }
//                        .frame(width: 64, height: 64)
//                        .scaleEffect(buttonScale)
//
//                    }
////                    .padding()
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//}
struct GameView_Previews: PreviewProvider {
    static var game: GameData = GameData(id: "", name: "", images: [], about: "", details: [], stars: 0, age: "")
    
    static var previews: some View {
        GameView(game: game)
    }
}
//struct GameView: View {
//    var game: GameData
//    @EnvironmentObject var gamesData: UserDataViewModel
//    @State private var isFavorite = false
//    @State private var buttonScale: CGFloat = 1.0 // Added for button animation
//
//    var body: some View {
//        VStack(spacing: 8) {
//            ZStack {
//                RoundedRectangle(cornerRadius: 16)
//                    .foregroundColor(Color(white: 0.97))
//                    .frame(width: 360, height: 200)
//                    .shadow(radius: 2)
//
//                HStack(alignment: .top) {
//                    if game.images.indices.contains(1) {
//                        AsyncImage(url: URL(string: game.images[1].src)) { image in
//                            image
//                                .resizable()
//                                .frame(width: 180, height: 200)
////                                .cornerRadius(16, corners: [.topLeft, .bottomLeft])
//                                .cornerRadius(12)
//                                .shadow(radius: 2)
//                        } placeholder: {
//                            ProgressView()
//                                .frame(width: 180, height: 200)
//                                .cornerRadius(12)
//                                .shadow(radius: 2)
//                        }
//                    } else {
//                        Text("Image not available")
//                            .foregroundColor(.gray)
//                    }
//
//                    VStack(alignment: .leading) {
//                        Text(game.name)
//                            .font(.title)
//                            .bold()
//
//                        HStack {
//                            Text(String(format: "%.1f", game.stars))
//                                .foregroundColor(.red)
//                                .font(.subheadline)
//                            RatingView(rating: .constant(game.stars))
//                                .font(.subheadline)
//                        }
//
//                        Text(game.age)
//                            .font(.subheadline)
//
//                        if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
//                            Text("Release Date:")
//                                .font(.subheadline)
//                            Text(releaseDateDetail.values.joined(separator: ", "))
//                                .font(.subheadline)
//                        }
//                    }
//                    .padding(.leading, 8)
//
//                    Spacer()
//
//                    Button(action: {
//                        withAnimation {
//                            isFavorite.toggle()
//                            buttonScale = isFavorite ? 1.2 : 1.0
//                            if isFavorite {
//                                gamesData.addFavoriteGame(game)
//                            } else {
//                                gamesData.deleteFavoriteGame(game)
//                            }
//                        }
//                    }) {
//                        Image(systemName: isFavorite ? "heart.fill" : "heart")
//                            .frame(width: 44, height: 44)
//                            .foregroundColor(.white)
//                            .background(isFavorite ? Color.red : Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
//                            .cornerRadius(22)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 22)
//                                    .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4)
//                            )
//                            .shadow(radius: 2)
//                    }
//                    .scaleEffect(buttonScale)
//                }
//                .padding()
//            }
//        }.padding(.horizontal,12)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
struct GameView: View {
    var game: GameData
    @EnvironmentObject var gamesData: UserDataViewModel
    @State private var isFavorite = false
    @State private var buttonScale: CGFloat = 1.0 // Added for button animation
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(white: 0.97))
                    .frame(width: 360, height: 200)
                    .shadow(radius: 2)
                
                HStack(alignment: .top) {
                    if game.images.indices.contains(1) {
                        AsyncImage(url: URL(string: game.images[1].src)) { image in
                            image
                                .resizable()
                                .frame(width: 180, height: 200)
                                .cornerRadius(12)
                                .shadow(radius: 2)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 180, height: 200)
                                .cornerRadius(12)
                                .shadow(radius: 2)
                        }
                    } else {
                        Text("Image not available")
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(game.name)
                            .font(Font.custom("Saira SemiCondensed", size: 18))
                            .bold()
                            .padding(2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .multilineTextAlignment(.leading)
                            
                        HStack {
                            //                            Spacer()
                            Text(Double(game.stars).description)
                                .foregroundColor(.black)
                                .font(.subheadline)
                            RatingView(rating: .constant(game.stars))
                                .font(.subheadline)
                        }.padding(2)
                        
                        Text(game.age)
                            .font(.subheadline)
                        
                        if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                            //                            Text("Release Date:")
                            //                                .font(.subheadline)
                            Text(releaseDateDetail.values.joined(separator: ", "))
                                .font(.subheadline)
                        }
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                    HStack{
                        
                        //                        Spacer()
                        Button(action: {
                            withAnimation {
                                isFavorite.toggle()
                                buttonScale = isFavorite ? 1.2 : 1.0
                                if isFavorite {
                                    gamesData.addFavoriteGame(game)
                                } else {
                                    gamesData.deleteFavoriteGame(game)
                                }
                            }
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .frame(width: 28, height: 28)
                                .foregroundColor(.white)
                                .background(isFavorite ? Color.red : Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
                                .cornerRadius(22)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 22)
                                        .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4)
                                )
                                .shadow(radius: 2)
                        }
                        .scaleEffect(buttonScale)
                        
                    }
                        .padding(2)
                }
                .padding()
            }
            Spacer() // Add a spacer to push the button to the bottom
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}
//import SwiftUI
//
//struct GameView: View {
//    var game: GameData
//    @EnvironmentObject var gamesData: UserDataViewModel
//    @State private var isFavorite = false
//    var body: some View {
//
//            GeometryReader { geometry in
//            VStack {
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(Color(white: 0.97))
//                        .frame(width: 360, height: 200)
//                        .cornerRadius(16)
//
//                    HStack {
//                        if game.images.indices.contains(1) {
//                            // Check if the array contains an element at index 1
//                            AsyncImage(url: URL(string: game.images[1].src)) { image in
//                                image
//                                    .resizable()
//                                    .frame(width: 180, height: 200)
//                                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                            } placeholder: {
//                                ProgressView()
//                                    .frame(width: 180, height: 200)
//                                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                            }
//                        } else {
//                            // Handle the case when index 1 is out of range
//                            Text("Image not available")
//                        }
//                            VStack(alignment: .leading ) {
//
//                                Text(game.name)
//                                    .font(Font.custom("Saira SemiCondensed", size: 18))
//                                    .bold()
//                                    .padding(2)
//                                    .frame(maxWidth: .infinity,alignment: .leading)
//                                    .multilineTextAlignment(.leading)
//                                HStack{
//                                    Text(Double(game.stars).description)
//                                        .font(.system(size: 15))
//                                    RatingView(rating: .constant(game.stars))
//                                        .font(.system(size: 15))
//                                }
//                                .padding(.top , 4)//تعديل اليوم
//
//
//                                Text(game.age)
//
//                                if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
//                                    HStack {
//                                        Text(releaseDateDetail.values.joined(separator: ", "))
//                                            .font(.footnote)
//                                    }
//                                }
//
//                            }
//
//                        Button(action: {
//                            if !isFavorite {
//                                gamesData.addFavoriteGame(game)
//                            }
//                            isFavorite.toggle()
//                        }) {
//                            Image(systemName: "heart")
//                                .frame(width: 30, height: 30)
//                                .foregroundColor(.white)
//                                .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
//                                .overlay(RoundedRectangle(cornerRadius: 16)
//                                    .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
//                                .cornerRadius(16)
//                        }.frame(maxWidth: .infinity, alignment: .bottomTrailing)
//
//                            .padding(.vertical, -100)
//
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//                }
//
//                .padding(.horizontal)
//            }
//        }
//    }
//}
//
