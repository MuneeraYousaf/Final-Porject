//
//  CommentView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI
import FirebaseAuth
struct CommentView: View {
//    var game: GameData
    @State var comment = ""
    @State  var commentText = ""
    @State  var userRating = 0
    var game: GameData
    
    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
        ScrollView{
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: 360,height: 200)
                    .cornerRadius(16)
                VStack{
                    HStack{
                        AsyncImage(url:URL(string:  "(https://source.unsplash.com/40x40/?person"))
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .cornerRadius(16)
                        Text(gamesData.userss.username)
                        
                    } .frame(maxWidth: .infinity,alignment: .leading)
//                    RatingView(rating: .constant(0))
                    RatingViews(rating: $userRating)
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    TextEditor(text: $comment)
//                    .frame(maxHeight : 56)
                    .background()
                    Spacer()
                    HStack{
                    
                        Spacer()
                        Button {
                            if  let currenruser = Auth.auth().currentUser?.email {
                                let newComment = Comment(userID: currenruser, gameID: game.id, text: comment, rating: userRating)
                                gamesData.addComment(newComment)
                                
                                // Clear the comment input and rating
                                comment = ""
                                userRating = 0
                            }else {
                                //MARK: Show Alart
                            }
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
            ForEach(gamesData.comments, id: \.id){ comments in
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
                                Text(comments.gameID)
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                            RatingView(rating: .constant(comments.rating))
                                .font(Font.custom("Saira SemiCondensed", size: 12))
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Spacer()
                            Text(comments.text)
                        }
                        
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

