//
//  ProfileView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var users: UserDataViewModel
    @State var showNextPage: Bool = false
    var body: some View {
        ForEach(users.users, id: \.id){
            i in
            Text(i.email)
        }
        @Environment(\.locale) var locale
        NavigationStack{
            TabView{
                VStack{
                    ZStack(alignment: .bottomTrailing){
                        Button(action: {
                            showNextPage = true
//                                showImagePicker = true
                        }, label: {
            //                AsyncImage(url: URL(string:"https://source.unsplash.com/200x200/?[user]"))
            //                    .resizable()
            //                    .frame(width: 120, height: 120)
            //                    .clipShape(Circle())
                                 Circle()
                                .frame(width: 120, height: 120)
//                                if let image = vm.selectedImage {
//                                    Image(uiImage: image)
//                                        .resizable()
//                                        .scaledToFit()
//                                                            .clipShape(Circle())
//                                                            .frame(width: 250 , height: 250)
//                                                    } else {
//                                                        Image(systemName: "person.fill")
//                                                        .font(.system(size: 64))
//                                                        .padding()
//                                                        .foregroundColor(Color(.label))
//                                                        }
                                
                        })
                        .sheet(isPresented: $showNextPage){
                            ImageProfileView()
                        }
                        Image(systemName: "camera.fill")
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .clipShape(Circle())
                    }
                        .padding()
                    Text("Afrah")
                        .font(Font.custom("Saira SemiCondensed", size: 30)
                            .weight(.medium)
                        )
                        .foregroundColor(.black)
                        .padding()
                    VStack{
                        HStack{
                            Text("name")
                                .font(Font.custom("Saira SemiCondensed", size: 20))
                                .foregroundColor(.black)
                            //                        .padding()
                            Spacer()
                            Text("AdomShafi007")
                                .font(Font.custom("Saira SemiCondensed", size: 18))
                                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                        }
                        //                .frame(maxWidth: .infinity , alignment : .leading)
                        .padding(.vertical)
                        HStack{
                            Text("name email")
                                .font(Font.custom("Saira SemiCondensed", size: 20))
                                .foregroundColor(.black)
                            //                        .padding(12)
                            Spacer()
                            Text("adomshafi007@gmail.com")
                                .font(Font.custom("Saira SemiCondensed", size: 18))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                        }
                        //                .frame(maxWidth: .infinity , alignment : .leading)
                        .padding(.vertical)
                        HStack{
                            Text("number")
                                .font(Font.custom("Saira SemiCondensed", size: 20))
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            //                        .padding(12)
                            Spacer()
                            Text("+8801704889390")
                                .font(Font.custom("Saira SemiCondensed", size: 18))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                        }
                        //                .frame(maxWidth: .infinity , alignment : .leading)
                        .padding(.vertical)
                    }
                    Spacer()
                    //                    .padding(.horizontal)
                }
                
                .padding(.horizontal , 20)
                
                .toolbar{
                    ToolbarItemGroup(placement:.navigationBarTrailing){
                   
                            Button(action: {
                                
                            }, label: {
                                Image("ion-log-out")
                                    .resizable()
                    .frame(width: 30, height: 30)

                                    .padding(.horizontal,16)
                                    .padding(.vertical,8)
//                                        .padding(.trailing ,320)
                            })
                            .buttonStyle(.plain)
                            
//
                        }
                    }
         
            }
        }
    }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        .environmentObject(UserDataViewModel())
    }
}
