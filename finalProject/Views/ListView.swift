
import SwiftUI

struct ListView: View {
    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
        //       صفحه قائمه الالعاب المفضله
        ZStack {
            BackgroundView()
            VStack{
                VStack{
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 40, alignment: .center)
                        .padding(-5)
                    Text("Games Vault")
                        .font(
                            .custom(
                                "SairaSemiCondensed-SemiBold",
                                fixedSize: 20)
                            .weight(.medium)
                        )
                    
                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514)).padding(-10)
                    
                    ScrollView{
                        VStack{
                            ForEach(gamesData.favoriteGames, id: \.id) { game in
                                
                                GameComponentView(game: game)
                                
                                
                            }
                            
                        }
                    }
                }
            }
            }
            .onAppear(){
                gamesData.fetchFavoriteGames()
            
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
