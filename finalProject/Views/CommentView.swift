//
//  CommentView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct CommentView: View {
    @State var Comment = ""
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
                    RatingView(rating: .constant(0))
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
                            // do some action
                        } label: {
                            Text("Add rating")
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

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
