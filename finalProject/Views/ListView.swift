//
//  ListView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
//        //   صفحه قائمه الالعاب المفضله
//        VStack{
//            HStack{
                //                    Image(systemName: "line.3.horizontal")
                //                        .frame(width: 21, height: 21)
                //                        .foregroundColor(.black)
                //                        .padding(.horizontal,16)
                //                        .padding(.vertical,8)
//                Text("my List")
//                    .font(
//                        Font.custom("Saira SemiCondensed", size: 30)
//                            .weight(.medium)
//                    )
//                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
//                    .frame(maxWidth: .infinity , alignment: .center)
                //                        .padding(.horizontal , 30)
                //                    Image("Ellipse 30")
                //                        .resizable()
                //                        .frame(width: 50, height: 50)
                //                        .clipShape(Circle())
//                AsyncImage(url: URL(string:"https://source.unsplash.com/200x200/?[user]"))
//                //                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .clipShape(Circle())
//            }
//            .padding(.horizontal)
//            .padding(.top)
//            Spacer()
            ScrollView{
                VStack{
                    ForEach(gamesData.favoriteGames, id: \.id) { game in
//                        Text(game.name)
                        //                        NavigationLink(
                        ////                            destination: {
                        //                                DetailsGameView(game: game)
                        //                            }, label: {
                        GameComponentView(game:game)
                        .frame(width: .infinity, height: 200)}
                    //                        )
                    //                    }
                    
                    
                    
//                    List(gamesData.favoriteGames, id: \.id) { game in
//                        Text(game.name)
//                        Button( action: {
//                            gamesData.deleteFavoriteGame(game)
//                        },label:  {
//                            Text("Delete")
//                                .foregroundColor(.red)
//                        })
//                    }
                }
//            }
        }.onAppear(){
            gamesData.fetchFavoriteGames()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
