//
//  DetailsGameView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct DetailsGameView: View {
    var game : GameData
    var body: some View {
//        NavigationView{
        ScrollView{
            VStack{
                Image("Game 1")
                    .resizable()
                    .frame(width: 360,height: 280)
                    .scaledToFit()
                    .cornerRadius(16)
                    .padding()
                ScrollView(.horizontal , showsIndicators: false){
                    HStack{
                        VStack{
                            //GameRate
                            Text("Rate")
                            //                        .font(Font.custom("Saira SemiCondensed", size: 16))
                            //                        .fontWeight(.medium)
                            //                        .padding(2)
                                .bold()
                                .font(Font.custom("Saira SemiCondensed", size: 19))
                                .padding(2)
                            
                            Image(systemName: "star")
                                .font(Font.custom("Saira SemiCondensed", size: 12))
                                .fontWeight(.medium)
                            
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
                            Text("Pric")
                                .bold()
                                .font(Font.custom("Saira SemiCondensed", size: 19))
                                .padding(2)
                            Text("$10.99")
                            //                        .font(Font.custom("Saira SemiCondensed", size: 12))
                            //                        .fontWeight(.medium)
                                .font(Font.custom("Saira SemiCondensed", size: 12))
                                .fontWeight(.medium)
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
                            Text(" June 22, 2023")
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
                            Text("13+")
                                .font(Font.custom("Saira SemiCondensed", size: 12))
                                .fontWeight(.medium)
                        }
                    }.padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .trailing)
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
                        
                        Text("Text Details")
                            .font(Font.custom("Saira SemiCondensed", size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        //platforms,WhereToPlay,Publisher,gametype,Release date
//                        if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
//                            HStack {
//                                //                                    Text(releaseDateDetail.key)
//                                //                                        .font(.footnote)
//                                Text(releaseDateDetail.values.joined(separator: ", "))
//                                    .font(.footnote)
//                            }
//                        }
                        Text("Where To Play: ")
                            .font(Font.custom("Saira SemiCondensed", size: 12))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        Text("Platform: PlayStation 5")
                            .font(Font.custom("Saira SemiCondensed", size: 12))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        Text("Publisher: Square Enix")
                            .font(Font.custom("Saira SemiCondensed", size: 12))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        Text("Topics: Magic and Fantasy, Adventures, Friendship")
                            .font(Font.custom("Saira SemiCondensed", size: 12))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        Text("Release date: June 22, 2023")
                            .font(Font.custom("Saira SemiCondensed", size: 12))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        Text("Text Reviews")
                            .font(Font.custom("Saira SemiCondensed", size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(2)
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
//                    
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
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: CommentView()) {
                                Text("Text Seeall")
                                //                            Image(systemName: "arrow.right.square")
                            }.buttonStyle(.plain)
                        
                        
                    }.padding(.horizontal)
                }
            }
        }
//       }
    

    
}

//struct DetailsGameView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        let sampleGame = GameData(
//            id: "",
//            name: "",
//            images: [],  // Add an array of Image objects here if needed
//            about: "",
//            details: [], // Add an array of Detail objects here if needed
//            stars: 4,
//            age: "13+"
//        )
//        DetailsGameView()
//    }
//}
