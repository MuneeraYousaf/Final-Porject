////
////  HomeView.swift
////  finalProject
////
////  Created by Sarah on 04/09/2023.
////
//
import SwiftUI

struct HomeView: View {
    @State var  searchedText :String = ""
    @State var gametype : GameType = .all
    @State var platforms : PlatForm = .Xbox
    @State var show = false

    var body: some View {


            VStack{
                HStack{
                    //                Image(systemName: "line.3.horizontal")
                    Spacer()
                    Text("Games Vault")
                        .font(.title)
                        .bold()
                    Spacer()
                    AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person"))
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .cornerRadius(16)
                }
                .padding()

//                HStack{
//                    Image(systemName: "magnifyingglass")
//                    TextField("Search Game..", text: $searchedText)
//                }
//                .padding()
//
//                .background(RoundedRectangle(cornerRadius: 12.5)
//                    .fill(.gray.opacity(0.25)))
//                .padding(.horizontal)
                // Search Text Field
                VStack{
                    TextField("Text search", text: $searchedText)
                        .padding()
                        .frame(height:40)
                        .background(Color(white: 0.97))
                        .cornerRadius(16)
                        
                }.padding(.horizontal)
                HStack{
                    Text("Text categories")
                        .foregroundColor(.gray)
                    Picker("", selection: $gametype) {
                        Text("Text all")
                            .tag(GameType.all)
                        Text("Text action")
                            .tag(GameType.action)
                        Text("Text adventure")
                            .tag(GameType.adventure)
                        Text("Text sports")
                            .tag(GameType.sports)
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    Text("Text Platforms")
                        .foregroundColor(.gray)

                    Picker("", selection: $platforms) {
                        Text("Text PlayStation")
                            .tag(PlatForm.PlayStation)
                        Text("Text NintendoSwitch")
                            .tag(PlatForm.NintendoSwitch)
                        Text("Text Windows")
                            .tag(PlatForm.Windows)
                        Text("Text Xbox")
                            .tag(PlatForm.Xbox)
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)

                }

                ScrollView(showsIndicators:false){
                    NavigationLink(
                        destination: {
                            DetailsGameView()
                        }, label: {
                            GameView()}
                    )

//                                    ZStack {
//                                        if !show {
//
//                                            GameView()
////                                                .padding()
//
//                                        } else {
//                                            DetailsGameView()
//                                    .padding()
//                                .transition(.move(edge: .trailing))
//                                .zIndex(1)
////                                                .fullScreenCover(isPresented: $show, content: DetailsGameView.init)
////                                                .navigationBarBackButtonHidden(true)
//                                    
//                                        }
//                                    }
//                                    .onTapGesture {
//                                        withAnimation(.spring()) {
//                                            show.toggle()
//                                        }
//                                    }
                }

            }
//            .fullScreenCover(isPresented: $show, content: DetailsGameView.init)
//        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




