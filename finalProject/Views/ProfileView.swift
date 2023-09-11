
import SwiftUI
import Firebase


struct ProfileView: View {
    @EnvironmentObject var users: UserDataViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var showNextPage: Bool = false
    var body: some View {

        @Environment(\.locale) var locale
        NavigationView{
            TabView{
                VStack{
                    ZStack(alignment: .bottomTrailing){
                        Button(action: {
                            showNextPage = true
        
                        }, label: {
                    
                            Circle()
                                .frame(width: 120, height: 120)
   
                            
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
                                .font(Font.custom("SairaSemiCondensed-SemiBold.ttf", size: 18))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                        }
           
                    }
           
                    .padding(.vertical)
                    HStack{
                        Text("number")
                            .font(Font.custom("SairaSemiCondensed-SemiBold.ttf", size: 20))
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                        //                        .padding(12)
                        Spacer()
                        
                        Text(users.userss.phone)
                            .font(Font.custom("SairaSemiCondensed-SemiBold.ttf", size: 18))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                    }
           
                }
   
                .padding(.vertical)
            }
            Spacer()
                .toolbar{
                    ToolbarItemGroup(placement:.navigationBarTrailing){
                        
                        Button(action: {
                            
                        }, label: {
                            Image("ion-log-out")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                        
                        })
                        .buttonStyle(.plain)
                        
                        
                    }
        }
        
        .padding(.horizontal )
        
     
        }.onAppear(){
            if authViewModel.user != nil {
                users.fetchUsers()

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

