////
////  DetailsGameView.swift
////  finalProject
////
////  Created by Sarah on 04/09/2023.
////
//
//import SwiftUI
//
struct DetailsGameView: View {
    var game : GameData
    @State private var currentPage = 0
    var body: some View {
        //        NavigationView{
        ZStack {
            BackgroundView()
        ScrollView{
            
          
                VStack{
                    Text(game.name)
                        .font(Font.custom("Saira SemiCondensed", size: 30))
                    //                    .fontWeight(.)
                    //                ScrollView {
                    //                    VStack {
                    //                        TabView(selection: $currentPage) {
                    //                            ForEach(1..<game.images.count, id: \.self) { index in
                    //                                if let imageURL = URL(string: game.images[index].src) {
                    //                                    AsyncImage(url: imageURL) { phase in
                    //                                        switch phase {
                    //                                        case .empty:
                    //                                            ProgressView()
                    //                                                .frame(width: 360, height: 280)
                    //                                        case .success(let image):
                    //                                            image
                    //                                                .resizable()
                    //                                                .scaledToFit()
                    //                                                .frame(width: 360, height: 280)
                    //                                        case .failure(_):
                    //                                            Text("Failed to load image")
                    //                                                .frame(width: 360, height: 280)
                    //                                        @unknown default:
                    //                                            EmptyView()
                    //                                        }
                    //                                    }
                    //                                } else {
                    //                                    Text("Invalid URL")
                    //                                        .frame(width: 360, height: 280)
                    //                                }
                    //                            }
                    //                        }
                    //                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    //                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    //                        .frame(width: 360, height: 280)
                    //                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    //
                    //
                    //                    }
                    //                }
                    ScrollView {
                        TabView(selection: $currentPage) {
                            ForEach(1..<game.images.count, id: \.self) { index in
                                if let imageURL = URL(string: game.images[index].src) {
                                    AsyncImage(url: imageURL) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 360, height: 280)
                                                .background(Color.gray.cornerRadius(20)) // Apply corner radius to placeholder
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 360, height: 280)
                                                .cornerRadius(20) // Apply corner radius to loaded image
                                        case .failure(_):
                                            Text("Failed to load image")
                                                .frame(width: 360, height: 280)
                                                .background(Color.gray.cornerRadius(20)) // Apply corner radius to error message
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Text("Invalid URL")
                                        .frame(width: 360, height: 280)
                                        .background(Color.gray.cornerRadius(20)) // Apply corner radius to error message
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                                            .frame(width: 360, height: 280)
                                            .background(Color.gray.cornerRadius(20)) // Apply corner radius to the entire TabView
                        
                        
                    }
                    
                    
                    
                    ScrollView(.horizontal , showsIndicators: false){
                        HStack{
                            
                            VStack{
                                //GameRate
                                Text("Rate")
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))//تعديل اليوم
                                
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(2)
                                Spacer()
                                HStack{
                                    //                                Text(Double(game.stars).description)
                                    //                                    .font(Font.custom("Saira SemiCondensed", size: 12))
                                    //                                    .fontWeight(.medium)
                                    RatingView(rating: .constant(game.stars))
                                        .font(Font.custom("Saira SemiCondensed", size: 12))
                                        .fontWeight(.medium)
                                }
                                //                    Image(systemName: "star")
                                //                        .font(Font.custom("Saira SemiCondensed", size: 12))
                                //                        .fontWeight(.medium)
                                //                        .font(Font.custom("Saira SemiCondensed", size: 12))
                                //                        .fontWeight(.medium)
                            }
                            
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            //                Spacer()
                            //Pricing
                            VStack{
                                Text("Text Price")
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                if let pricingDetail = game.details.first(where: { $0.key == "Pricing structure" }) {
                                    if let pricingValue = pricingDetail.values.first {
                                        
                                        Text(pricingValue)
                                            .font(Font.custom("Saira SemiCondensed", size: 12))
                                            .fontWeight(.medium)
                                    }
                                }
                            }
                            
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            
                            VStack{
                                Text("Release date:")
                                //                        .frame(maxWidth: .infinity,alignment: .leading)
                                //                        .padding(2)
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                //platforms,WhereToPlay,Publisher,gametype,Release date
                                if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                                    HStack {
                                        //
                                        
                                        Text(releaseDateDetail.values.joined(separator: ", "))
                                            .font(Font.custom("Saira SemiCondensed", size: 12))
                                            .fontWeight(.medium)
                                    }
                                }
                                //                            Text(" June 22, 2023")
                                //                        .font(Font.custom("Saira SemiCondensed", size: 10))
                                //                        .fontWeight(.regular)
                                //                        .frame(maxWidth: .infinity,alignment: .leading)
                                
                            }
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            VStack{
                                Text("Publisher:")
                                //                    .font(Font.custom("Saira SemiCondensed", size: 12))
                                //                    //                    .fontWeight(.regular)
                                //                        .frame(maxWidth: .infinity,alignment: .leading)
                                //                        .padding(2)
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                Text("Square Enix")
                                //                        .font(Font.custom("Saira SemiCondensed", size: 10))
                                //                        .fontWeight(.regular)
                                //                        .frame(maxWidth: .infinity,alignment: .leading)
                                    .font(Font.custom("Saira SemiCondensed", size: 12))
                                    .fontWeight(.medium)
                            }
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            VStack{
                                Text("Age")
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                Text(game.age)
                                    .font(Font.custom("Saira SemiCondensed", size: 12))
                                    .fontWeight(.medium)
                            }
                        }.padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                }
                
                
                //                VStack{
                //                    //GameRate
                //                    Text(game.stars.description)
                //                        .font(Font.custom("Saira SemiCondensed", size: 12))
                //                        .fontWeight(.medium)
                //                    RatingView(rating: .constant(game.stars))
                //                        .font(Font.custom("Saira SemiCondensed", size: 12))
                //                        .fontWeight(.medium)
                //                    //Pricing
                //                    Text("$10.99")
                //                        .font(Font.custom("Saira SemiCondensed", size: 12))
                //                        .fontWeight(.medium)
                //
                //                }.padding(.horizontal)
                //                    .frame(maxWidth: .infinity, alignment: .trailing)
                //                ForEach(game.details, id: \.key){ i in
                VStack{
                    //GameDescription
                    Text("Text About")
                        .font(Font.custom("Saira SemiCondensed", size: 20))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(2)
                    Text(game.about)
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.regular)
                    
                    //                   Re
                    //platforms,WhereToPlay,Publisher,gametype,Release date
                    //                        if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                    //                            HStack {
                    //                                //                                    Text(releaseDateDetail.key)
                    //                                //                                        .font(.footnote)
                    //                                Text(releaseDateDetail.values.joined(separator: ", "))
                    //                                    .font(.footnote)
                    //                            }
                    //                        }
                    //                        Text("Where To Play: ")
                    //                            .font(Font.custom("Saira SemiCondensed", size: 12))
                    //                            .fontWeight(.regular)
                    //                            .frame(maxWidth: .infinity,alignment: .leading)
                    //                            .padding(2)
                    //                        Text("Platform: PlayStation 5")
                    //                            .font(Font.custom("Saira SemiCondensed", size: 12))
                    //                            .fontWeight(.regular)
                    //                            .frame(maxWidth: .infinity,alignment: .leading)
                    //                            .padding(2)
                    //                        Text("Publisher: Square Enix")
                    //                            .font(Font.custom("Saira SemiCondensed", size: 12))
                    //                            .fontWeight(.regular)
                    //                            .frame(maxWidth: .infinity,alignment: .leading)
                    //                            .padding(2)
                    //                        Text("Topics: Magic and Fantasy, Adventures, Friendship")
                    //                            .font(Font.custom("Saira SemiCondensed", size: 12))
                    //                            .fontWeight(.regular)
                    //                            .frame(maxWidth: .infinity,alignment: .leading)
                    //                            .padding(2)
                    //                        Text("Release date: June 22, 2023")
                    //                            .font(Font.custom("Saira SemiCondensed", size: 12))
                    //                            .fontWeight(.regular)
                    //                            .frame(maxWidth: .infinity,alignment: .leading)
                    //
                    //تعديل اليوم
                    HStack{
                        //                    Spacer()
                        
                        Text("Text Reviews")
                            .font(Font.custom("Saira SemiCondensed", size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(15)
                        
                        Spacer()
                        NavigationLink(
                            destination: CommentView(game: game)) {
                                
                                Text("Text Seeall")
                                //                                   Spacer()
                                    .frame(maxWidth: .infinity,alignment: .trailing)
                                    .padding(12)
                                //                            .padding(.trailing,15)
                                //                            Image(systemName: "arrow.right.square")
                            }.buttonStyle(.plain)
                        
                        
                        //                    Spacer()
                        ////                    Text("Text Reviews")
                        ////                        .font(Font.custom("Saira SemiCondensed", size: 20))
                        ////                        .fontWeight(.medium)
                        ////                        .frame(maxWidth: .infinity,alignment: .leading)
                        ////                        .padding(2)
                    }
                    //                .padding(.horizontal)
                    //
                    
                }
            }
            
            //                    .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
        }
            
            ////
            //                    HStack{
            //                        ZStack{
            //                            Rectangle()
            //                                .foregroundColor(Color(white: 0.97))
            //                                .frame(width: 360,height: 150)
            //                                .cornerRadius(16)
            //                            VStack{
            //                                HStack{
            //                                    AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person"))
            //                                        .scaledToFit()
            //                                        .frame(width: 40, height: 40)
            //                                        .cornerRadius(16)
            //                                    Text("Username")
            //
            //                                }
            //                                .frame(maxWidth: .infinity,alignment: .leading)
            //
            //                                RatingView(rating: .constant(4))
            //                                    .font(Font.custom("Saira SemiCondensed", size: 12))
            //                                    .fontWeight(.medium)
            //                                    .frame(maxWidth: .infinity,alignment: .leading)
            //                                Spacer()
            //                            }
            //
            //                        }
            //                    }
            //                    .padding(.horizontal)
            
            
        }
    
    
    
    
    
    
}



//struct DetailsGameView: View {
//    var game: GameData
//    @State private var currentPage = 0
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                TabView(selection: $currentPage) {
//                    ForEach(0..<game.images.count, id: \.self) { index in
//                        if let imageURL = URL(string: game.images[index].src) {
//                            AsyncImage(url: imageURL) { phase in
//                                switch phase {
//                                case .empty:
//                                    ProgressView()
//                                        .frame(width: 360, height: 280)
//                                case .success(let image):
//                                    image
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 360, height: 280)
//                                        .cornerRadius(16)
//                                case .failure(_):
//                                    Text("Failed to load image")
//                                        .frame(width: 360, height: 280)
//                                @unknown default:
//                                    EmptyView()
//                                }
//                            }
//                        } else {
//                            Text("Invalid URL")
//                                .frame(width: 360, height: 280)
//                        }
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                .frame(width: 360, height: 280)
//
//                // Your other content here
//
//                // Page control dots
////                PageControl(numberOfPages: game.images.count, currentPage: $currentPage)
//                    .padding(.vertical)
//            }
//        }
//    }
//}
import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(page == currentPage ? .blue : .gray)
            }
        }
    }
}
