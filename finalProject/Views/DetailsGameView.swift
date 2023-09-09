//
//  DetailsGameView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct DetailsGameView: View {
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
                VStack{
                    //GameRate
                    Text("4.0")
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.medium)
                    RatingView(rating: .constant(4))
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.medium)
                    //Pricing
                    Text("$10.99")
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.medium)
                    
                }.padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                VStack{
                    //GameDescription
                    Text("Text About")
                        .font(Font.custom("Saira SemiCondensed", size: 20))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(2)
                    Text("""
FINAL FANTASY XVI gives players an entirely new world and cast of characters set within the storied Final Fantasy universe. Clive is a prince of Rosaria, one of a handful of kingdoms in Valisthea, a land consumed by diabolical political figures and where natural magic users are looked upon as subhuman. Gifted with an ability to use fire magic, Clive is betrayed by his mother and placed in the service of a neighboring kingdom, where he must fight their wars or die. He eventually escapes and begins a journey toward revenge, justice, and equality.

""")
                    .font(Font.custom("Saira SemiCondensed", size: 12))
                    .fontWeight(.regular)
                    
                    Text("Text Details")
                        .font(Font.custom("Saira SemiCondensed", size: 20))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(2)
                    //platforms,WhereToPlay,Publisher,gametype,Release date
                    Text("Where To Play: amazon")
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
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(white: 0.97))
                            .frame(width: 360,height: 150)
                            .cornerRadius(16)
                        VStack{
                            HStack{
                                AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person"))
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(16)
                                Text("Username")
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                            RatingView(rating: .constant(4))
                                .font(Font.custom("Saira SemiCondensed", size: 12))
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Spacer()
                        }
                        
                    }
                }
                .padding(.horizontal)
                
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
//        }
    }
}

struct DetailsGameView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsGameView()
    }
}
