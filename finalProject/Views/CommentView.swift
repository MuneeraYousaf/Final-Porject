//
//  CommentView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct CommentView: View {
//    var game: GameData
    @State var Comment = ""
    @State private var commentText = ""
    @State private var userRating = 0
    var body: some View {
        ScrollView{
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: 360,height: 200)
                    .cornerRadius(16)
                VStack{
                    HStack{
                        AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person"))
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .cornerRadius(16)
                        Text("Username")
                        
                    } .frame(maxWidth: .infinity,alignment: .leading)
//                    RatingView(rating: .constant(0))
                    RatingViews(rating: $userRating)
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    TextEditor(text: $Comment)
//                    .frame(maxHeight : 56)
                    .background()
                    Spacer()
                    HStack{
                    
                        Spacer()
                        Button {
//                            let newComment = Comment(userID: "V3ecxeslnCBp2kQGoHHp", gameID: GameData., text: commentText, rating: userRating)
//                            userDataViewModel.addComment(newComment)

                            // Clear the comment input and rating
                            commentText = ""
                            userRating = 0
                        } label: {
                            Text("Text rating")
    //                         .padding()
                                .frame(width: 100,height: 30)
                             .foregroundColor(.white)
                             .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
                             .overlay(RoundedRectangle(cornerRadius: 16)
                             .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
                          
                             .cornerRadius(16)
                             .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                } .frame(maxWidth: .infinity,alignment: .leading)
                
            }.padding(.horizontal)
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
                       
                        RatingView(rating: .constant(2))
                            .font(Font.custom("Saira SemiCondensed", size: 12))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Spacer()
                    }
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

//struct CommentView_Previews: PreviewProvider {
////     static var  =game: GameData
//    static var previews: some View {
//        CommentView().environmentObject(UserDataViewModel())
//    }
//}

struct RatingViews: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            ForEach(1..<6, id: \.self) { index in
                Button(action: {
                    rating = index
                }) {
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .font(.title).frame(width: 20)
                }
            }
        }
    }
}

