//
//  GameComponentView.swift
//  finalProject
//
//  Created by Afrah Faisal on 23/02/1445 AH.
//

import SwiftUI

struct GameComponentView: View {
    var game: GameData
    var body: some View {
        //        VStack{
        //            HStack{
        //                //
        //                Image("Rectangle")
        //                    .resizable()
        //                    .scaledToFit()
        //                    .frame(width: 200, height: 200)
        //                //                    .cornerRadius(20)
        //                //                .clipShape(Rectangle())
        //                Spacer()
        //                VStack(alignment: .leading){
        //                    HStack(alignment: .top){
        //                        Text("4.0")
        //                        Text("******")
        //                    }
        //                    //                    .padding()
        //                    Text("PUBG ")
        //                        .frame(alignment: .topTrailing)
        //                    Text("PlayerUnknown's Battlegrounds (PUBG) is an online multiplayer battle royale game developed and published by PUBG....")
        //                    //                    font(Font.custom("Saira SemiCondensed", size: 5))
        //                        .font(Font.body)
        //                    //                        .frame(width: 120 , height: 110, alignment: .topLeading )
        //
        //                }
        //                .frame(width: 200 , height: 160)
        //            }
        //            //            .padding(.horizontal)
        //        }  .padding(.horizontal , 1)
        //صفحة تصميم الالعاب المفضلة للمستخدم
                ZStack{
                            Rectangle()
                                .foregroundColor(Color(white: 0.97))
                                .frame(width: 370,height: 100)
                                .cornerRadius(16)
                            HStack{
                                VStack(spacing: 2){
                //                    AsyncImage(url: URL(string:"https://source.unsplash.com/250x200/?[videoGame]"))
                                    Image("baldurs")
//                                        .scaledToFill()
                                        .resizable()
                                        .frame(width:  90 , height: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                                .padding(.trailing)
                                Divider()
                                    .background(.gray)
                                    .frame(height: 75)
                                VStack(alignment: .leading){
                                    Text(game.name)
                                        .font(.system(size: 25))
                                        .bold()
                                        .padding(2)
//                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                                        .multilineTextAlignment(.leading)
//                                    HStack{
////                                        Text("4.0")
////                                            .font(.system(size:9))
//                                        RatingView(rating: .constant(game.stars))
//                                            .font(.system(size:9))
//                                    }
//                                    .padding(2)
//                                    Text(game.age)
//                                        .padding(2)
//                                    HStack{
//                                        Text("PlayStation 5")
//                                            .font(.footnote)
//                                        Text("| 2023")
//                                            .font(.footnote)
//                                    }
//                                    .padding(2)
                                    
//                                    Button {
//                                        // do some action
//                                    } label: {
//                                        Text("+")
//                //                         .padding()
//                                            .frame(width: 30,height: 30)
//                                         .foregroundColor(.white)
//                                         .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
//                                         .overlay(RoundedRectangle(cornerRadius: 16)
//                                         .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
//
//                                         .cornerRadius(16)
//
//                //                         .padding(.trailing)
//                                         .frame(maxWidth: .infinity, alignment: .trailing)
//                                    }
                                    
                                }
                                
                            }
                //            .padding()
//                }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .padding(.horizontal)
            }
        }
  

//struct GameComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameComponentView()
//    }
//}
