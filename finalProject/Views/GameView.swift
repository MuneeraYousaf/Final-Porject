//
//  GameView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(white: 0.97))
                .frame(width: 360,height: 200)
                .cornerRadius(16)
            HStack{
                VStack(spacing: 4){
//                    AsyncImage(url: URL(string:"https://source.unsplash.com/250x200/?[videoGame]"))
                    Image("Game 1")
                        .scaledToFill()
                        .frame(width:  180 , height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                VStack(alignment: .leading){
                    Text("Final Fantasy XVI")
                        .bold()
                        .padding(2)
                    HStack{
                        Text("4.0")
                            .font(.system(size:9))
                        RatingView(rating: .constant(4))
                            .font(.system(size:9))
                    }
                    .padding(2)
                    Text("age 16+")
                        .padding(2)
                    HStack{
                        Text("PlayStation 5")
                            .font(.footnote)
                        Text("| 2023")
                            .font(.footnote)
                    }
                    .padding(2)
                    
                    Button {
                        // do some action
                    } label: {
                        Text("+")
//                         .padding()
                            .frame(width: 30,height: 30)
                         .foregroundColor(.white)
                         .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196))
                         .overlay(RoundedRectangle(cornerRadius: 16)
                         .stroke(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.2784313725490196), lineWidth: 4))
                      
                         .cornerRadius(16)
                         
//                         .padding(.trailing)
                         .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                }
                
            }
//            .padding()
            
        }
        .padding(.horizontal)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
