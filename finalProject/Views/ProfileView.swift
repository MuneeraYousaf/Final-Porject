
import SwiftUI
import Firebase


struct ProfileView: View {
    @EnvironmentObject var users: UserDataViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showImagePicker: Bool = false //تعديل اليوم

    @ObservedObject var vm = ImageProfileViewModel() //تعديل اليوم

    @Environment(\.dismiss) var dismiss
    @State var showNextPage: Bool = false
    var body: some View {

        @Environment(\.locale) var locale
        NavigationView{
            TabView{
                ZStack {
                    BackgroundView()
                    VStack{
                        Button{
                           
                            showImagePicker = true
                        }
                    label: {
                        VStack{
                            if let image = vm.selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 250 , height: 250)
                            } else {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                                    .foregroundColor(Color(.label))
                            }
                            //تعديل اليوم

                            //
                            //                    }
                            //                }
                            //                if isButtonVisible {
                            //يحفظ الصوره في firebase
    //                        Button("Save Image") {
    //                            vm.UploadImage()
    ////                            if vm.showNextPage{
    ////                               dismiss()
    ////                            }
    //
    //
    //                        }
    //                        Button(action: {
    //
    //                            dismiss()
    //                        }, label: {
    //                            Text("Cancel")
    //                        })
                            //            label: {
                            //
                            //                    Image(systemName: "camera")
                            //                        .font(.system(size: 20))
                            //                        .padding()
                            //                        .foregroundColor(Color(.label))
                            //
                            //                }
                        }
                    }        .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $vm.selectedImage, showImagePicker: $showImagePicker)
                    }


                        
    //                    .font(Font.custom("Saira SemiCondensed", size: 30)
    //                        .weight(.medium)
    //                    )
    //                    .foregroundColor(.black)
    //                    .padding()
                        VStack{
                            HStack{
                                Text("name")
                                    .font(Font.custom("Saira SemiCondensed", size: 20))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                Text(users.userss.username)
                                    .font(Font.custom("Saira SemiCondensed", size: 18))
                                    .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                                
                                
                            }
                            
                            .padding(.vertical)
                            HStack{
                                Text("name email")
                                    .font(Font.custom("Saira SemiCondensed", size: 20))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                Text(users.userss.email)
                                    .font(Font.custom("Saira SemiCondensed", size: 18))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                            }
                            
                            //                    }
                            
                            .padding(.vertical)
                            HStack{
                                Text("number")
                                    .font(Font.custom("Saira SemiCondensed", size: 20))
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                //                        .padding(12)
                                Spacer()
                                
                                Text(users.userss.phone)
                                    .font(Font.custom("Saira SemiCondensed", size: 18))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                            }
                            .padding(.vertical)
                        }
                        Spacer()
                    }
                    .padding(.horizontal , 20)
                }
//                .padding(.vertical)
            }
//            Spacer()
                .toolbar{
                    ToolbarItemGroup(placement:.navigationBarTrailing){
                        
                        Button(action: {
                            
                        }, label: {
                            Image("ion_logout")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                        
                        })
                        .buttonStyle(.plain)
                        
                        
                    }
        }
        
        .padding(.horizontal )
        
            //تعديل اليوم

        }.onAppear(){
            if authViewModel.user != nil {
                users.fetchUsers()
                if let userID = Auth.auth().currentUser?.uid{
                    print(userID)
                    vm.UploadImage(forUserId: userID)
                }            }
            
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserDataViewModel())
    }
}

