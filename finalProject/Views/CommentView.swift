////
////  CommentView.swift
////  finalProject
////
////  Created by Sarah on 04/09/2023.
////
//
import SwiftUI
import FirebaseAuth
//struct CommentView: View {
////    var game: GameData
//    @State var comment = ""
//    @State  var commentText = ""
//    @State  var userRating = 0
//    var game: GameData
////    var user : UserModel
//    @EnvironmentObject var gamesData: UserDataViewModel
//    var body: some View {
//        ScrollView{
//
//            ZStack{
//                Rectangle()
//                    .foregroundColor(Color.white)
//                    .frame(width: 360,height: 200)
//                    .cornerRadius(16)
//                VStack{
//                    HStack{
//                        AsyncImage(url:URL(string:  "(https://source.unsplash.com/40x40/?person"))
//                            .scaledToFit()
//                            .frame(width: 40, height: 40)
//                            .cornerRadius(16)
//                        Text(gamesData.userss.username)
//
//                    } .frame(maxWidth: .infinity,alignment: .leading)
////                    RatingView(rating: .constant(0))
//                    RatingViews(rating: $userRating)
//                        .font(Font.custom("Saira SemiCondensed", size: 12))
//                        .fontWeight(.medium)
//                        .frame(maxWidth: .infinity,alignment: .leading)
//                    TextEditor(text: $comment)
////                    .frame(maxHeight : 56)
//                    .background()
//                    Spacer()
//                    HStack{
//
//                        Spacer()
//                        Button {
//                            if  let currenruser = Auth.auth().currentUser?.email {
//                                let newComment = Comment(userID: gamesData.userss.username, gameID: game.id, text: comment, rating: userRating)
//                                gamesData.addComment(newComment)
//
//                                // Clear the comment input and rating
//                                comment = ""
//                                userRating = 0
//                            }else {
//                                //MARK: Show Alart
//                            }
//                        } label: {
//                            Text("Text rating")
//    //                         .padding()
//                                .frame(width: 100,height: 30)
//                             .foregroundColor(.white)
//                             .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
//                             .overlay(RoundedRectangle(cornerRadius: 16)
//                             .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
//
//                             .cornerRadius(16)
//                             .frame(maxWidth: .infinity, alignment: .trailing)
//                        }
//                    }
//                } .frame(maxWidth: .infinity,alignment: .leading)
//
//            }.padding(.horizontal)
//            ForEach(gamesData.comments, id: \.id){ comments in
//                HStack{
//                    ZStack{
//                        Rectangle()
//                            .foregroundColor(Color(white: 0.97))
//                            .frame(width: 360,height: 150)
//                            .cornerRadius(16)
//                        VStack{
//                            HStack{
//                                AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person"))
//                                    .scaledToFit()
//                                    .frame(width: 40, height: 40)
//                                    .cornerRadius(16)
//                                Text(comments.userID)
//
//                            }
//                            .frame(maxWidth: .infinity,alignment: .leading)
//
//                            RatingView(rating: .constant(comments.rating))
//                                .font(Font.custom("Saira SemiCondensed", size: 12))
//                                .fontWeight(.medium)
//                                .frame(maxWidth: .infinity,alignment: .leading)
////                            Spacer()
//                            Text(comments.text).frame(maxWidth: .infinity, alignment: .leading)
//
//                        }
//
//                    }
//                }
//            }
//            .padding(.horizontal)
//
//        }.onAppear(){
//            gamesData.fetchComments(forGameID: game.id)
//            gamesData.fetchUsers()
//        }
//    }
//}
//
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
import SwiftUI


// CommentView for displaying individual comments
struct CommentView: View {
    @State var comment:String = ""
    @State var userRating = 0
    var game: GameData

    @EnvironmentObject var gamesData: UserDataViewModel

    var body: some View {
        ZStack{
            BackgroundView()
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        AsyncImage(url: URL(string: "https://source.unsplash.com/40x40/?person"))
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle()) // Use a circular avatar
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))

                        Text(gamesData.userss.username)
                            .font(.headline)
                    } .padding(.horizontal)
//                        .padding(.vertical)
                    RatingViews(rating: $userRating)
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.medium) .padding(.horizontal)

//                    TextEditor(text: $comment,  prompt: Text("Please input your comment"))
//                        .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
//                        .frame(minHeight: 100) // Adjust the minimum height as needed
                    ZStack(alignment: .leading) {
            
                        if comment.isEmpty {
                            Text("Add comment here....")
                                .frame(minHeight: 100)
                                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                                .foregroundColor(.gray)
                            
                        }
                            
                           
                        TextEditor(text: $comment)
                            .frame(minHeight: 100)
//                            .foregroundColor(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                           
                        
//                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                    } .padding(.horizontal)
//                        .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                                                  
                    Button(action: {
                        if let currentUser = Auth.auth().currentUser {
                            let newComment = Comment(userID: gamesData.userss.username, gameID: game.id, text: comment, rating: userRating)
                            gamesData.addComment(newComment)

                            // Clear the comment input and rating
                            comment = ""
                            userRating = 0
                        } else {
                            // Show an alert or handle authentication error
                        }
                    }) {
                        Text("Submit Comment")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
                            .cornerRadius(16)
                    }
                    .disabled(comment.isEmpty || userRating == 0)
                }
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                .cornerRadius(16)
                .shadow(radius: 2)
               
               
                ForEach(gamesData.comments, id: \.id) { comment in
                    CommentItemView(comment: comment)
                }
//                .padding(.horizontal)
            }
            .padding(.horizontal)

        }  .onAppear() {
            gamesData.fetchComments(forGameID: game.id)
            gamesData.fetchUsers()
        }
    }
}
//struct CommentView: View {
//    @State var comment = ""
//    @State var userRating = 0
//    var game: GameData
//
//    @EnvironmentObject var gamesData: UserDataViewModel
//
//    var body: some View {
//        ZStack{
//            BackgroundView()
//            ScrollView {
//                VStack(alignment: .leading, spacing: 16) {
//                    HStack {
//                        AsyncImage(url: URL(string: "https://source.unsplash.com/40x40/?person"))
//                            .scaledToFit()
//                            .frame(width: 40, height: 40)
//                            .clipShape(Circle()) // Use a circular avatar
//                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//
//                        Text(gamesData.userss.username)
//                            .font(.headline)
//                    }
//
//                    RatingViews(rating: $userRating)
//                        .font(Font.custom("Saira SemiCondensed", size: 12))
//                        .fontWeight(.medium)
//
//                    // TextEditor with Placeholder
//                    ZStack(alignment: .topLeading) {
//                        if comment.isEmpty {
//                            Text("Add comment here....")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 4)
//                                .padding(.vertical, 8)
//                        }
//                        TextEditor(text: $comment)
//                            .frame(minHeight: 100)
//
//                    } .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
//
//                    Button(action: {
//                        if let currentUser = Auth.auth().currentUser {
//                            let newComment = Comment(userID: gamesData.userss.username, gameID: game.id, text: comment, rating: userRating)
//                            gamesData.addComment(newComment)
//
//                            // Clear the comment input and rating
//                            comment = ""
//                            userRating = 0
//                        } else {
//                            // Show an alert or handle authentication error
//                        }
//                    }) {
//                        Text("Submit Comment")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
//                            .cornerRadius(16)
//                    }
//                    .disabled(comment.isEmpty || userRating == 0)
//                }
//                .padding(.horizontal)
//                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
//                .cornerRadius(16)
//                .shadow(radius: 2)
//
//                ForEach(gamesData.comments, id: \.id) { comment in
//                    CommentItemView(comment: comment)
//                }
//                .padding(.horizontal)
//            }
//
//        }
//        .onAppear() {
//            gamesData.fetchComments(forGameID: game.id)
//            gamesData.fetchUsers()
//        }
//    }
//}

import SwiftUI

//struct CommentItemView: View {
//    var comment: Comment // Assuming you have a Comment model
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 8) {
//            // User Avatar
//            AsyncImage(url: URL(string: "https://source.unsplash.com/40x40/?person"))
//                .scaledToFit()
//                .frame(width: 40, height: 40)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//
//            VStack(alignment: .leading, spacing: 4) {
//                // Username
//                Text(comment.userID)
//                    .font(.headline)
//
//                // Rating (You can customize the rating display as needed)
//                HStack(spacing: 4) {
//                    Text("Rating:")
//                    ForEach(1...5, id: \.self) { index in
//                        Image(systemName: index <= comment.rating ? "star.fill" : "star")
//                            .foregroundColor(.yellow)
//                    }
//                }
//
//                // Comment Text
//                Text(comment.text)
//                    .font(.body)
//            }
//        }
//        .padding(.vertical, 8)
//    }
//}
import SwiftUI

//struct CommentItemView: View {
//    var comment: Comment // Assuming you have a Comment model
//
//    var body: some View {
//        ZStack{
//            VStack(alignment: .leading) {
//                HStack() {
//                    // User Avatar
//                    AsyncImage(url: URL(string: "https://source.unsplash.com/40x40/?person"))
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//
//                    // Username and Rating
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text(comment.userID)
//                            .font(.headline)
//
//                        // Rating (You can customize the rating display as needed)
//                        HStack(spacing: 4) {
//                            Text("Rating:")
//                            ForEach(1...5, id: \.self) { index in
//                                Image(systemName: index <= comment.rating ? "star.fill" : "star")
//                                    .foregroundColor(.yellow)
//                            }
//                        }
//                    }
//                }
//
//                // Comment Text
//                Text(comment.text)
//                    .font(.body)
//            }
//            //
////            .padding(12)
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
//
//            .cornerRadius(12)
//            .shadow(radius: 2)
//            //        .frame(minWidth: .infinity)
//        }
//    }
//}
//struct CommentItemView: View {
//    var comment: Comment // Assuming you have a Comment model
//
//    var body: some View {
//        ZStack{
//            VStack(alignment: .leading) {
//                HStack() {
//                    // User Avatar
//                    AsyncImage(url: URL(string: "https://source.unsplash.com/40x40/?person"))
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//
//                    // Username and Rating
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text(comment.userID)
//                            .font(.headline)
//
//                        // Rating (You can customize the rating display as needed)
//                        HStack(spacing: 4) {
//                            Text("Rating:")
//                            ForEach(1...5, id: \.self) { index in
//                                Image(systemName: index <= comment.rating ? "star.fill" : "star")
//                                    .foregroundColor(.yellow)
//                            }
//                        }
//                    }
//                }
//
//                // Comment Text
//                Text(comment.text)
//                    .font(.body)
//            }
//            .frame(maxWidth: .infinity) // Expand horizontally to fill available space
//            .background(Color.white)
//            .cornerRadius(12)
//            .shadow(radius: 2)
//        }
//    }
//}

struct CommentItemView: View {
    var comment: Comment // Assuming you have a Comment model

    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 8) {
                HStack(spacing: 8) {
                    // User Avatar
                    AsyncImage(url: URL(string: "https://source.unsplash.com/40x40/?person"))
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    // Username and Rating
                    VStack(alignment: .leading, spacing: 4) {
                        Text(comment.userID)
                            .font(.headline)
                        
                        // Rating (You can customize the rating display as needed)
                  
                    }
                }
                HStack(spacing: 4) {
                    Text(comment.rating.description)
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= comment.rating ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
                // Comment Text
                Text(comment.text)
                    .font(.body)
            }
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)// Align content to the leading edge
            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
    }
}
