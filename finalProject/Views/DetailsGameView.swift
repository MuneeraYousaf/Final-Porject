
import SwiftUI
struct DetailsGameView: View {
    var game : GameData
    @State private var currentPage = 0
    var body: some View {
        //        NavigationView{
        ZStack {
            BackgroundView()
            ScrollView{
                
                
                VStack{
                    Text(game.name)
                        .font(Font.custom("Saira SemiCondensed", size: 30))
                    
                    ScrollView {
                        TabView(selection: $currentPage) {
                            ForEach(1..<game.images.count, id: \.self) { index in
                                if let imageURL = URL(string: game.images[index].src) {
                                    AsyncImage(url: imageURL) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 360, height: 280)
                                                .background(Color.gray.cornerRadius(20)) // Apply corner radius to placeholder
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 360, height: 280)
                                                .cornerRadius(20) // Apply corner radius to loaded image
                                        case .failure(_):
                                            Text("Failed to load image")
                                                .frame(width: 360, height: 280)
                                                .background(Color.gray.cornerRadius(20)) // Apply corner radius to error message
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Text("Invalid URL")
                                        .frame(width: 360, height: 280)
                                        .background(Color.gray.cornerRadius(20)) // Apply corner radius to error message
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        .frame(width: 360, height: 280)
                        .background(Color.gray.cornerRadius(20)) // Apply corner radius to the entire TabView
                        
                        
                    }
                    
                    
                    
                    ScrollView(.horizontal , showsIndicators: false){
                        HStack{
                            
                            VStack{
                                //GameRate
                                Text("Rate")
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))//تعديل اليوم
                                
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(2)
                                Spacer()
                                HStack{
                                    RatingView(rating: .constant(game.stars))
                                        .font(Font.custom("Saira SemiCondensed", size: 12))
                                        .fontWeight(.medium)
                                }
                                
                            }
                            
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            //                Spacer()
                            //Pricing
                            VStack{
                                Text("Text Price")
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                if let pricingDetail = game.details.first(where: { $0.key == "Pricing structure" }) {
                                    if let pricingValue = pricingDetail.values.first {
                                        
                                        Text(pricingValue)
                                            .font(Font.custom("Saira SemiCondensed", size: 12))
                                            .fontWeight(.medium)
                                    }
                                }
                            }
                            
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            
                            VStack{
                                Text("Release date:")
                                //                        .frame(maxWidth: .infinity,alignment: .leading)
                                //                        .padding(2)
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                //platforms,WhereToPlay,Publisher,gametype,Release date
                                if let releaseDateDetail = game.details.first(where: { $0.key == "Release date" }) {
                                    HStack {
                                        //
                                        
                                        Text(releaseDateDetail.values.joined(separator: ", "))
                                            .font(Font.custom("Saira SemiCondensed", size: 12))
                                            .fontWeight(.medium)
                                    }
                                }
                                
                            }
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            VStack{
                                Text("Publisher:")
                                
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                Text("Square Enix")
                                
                                    .font(Font.custom("Saira SemiCondensed", size: 12))
                                    .fontWeight(.medium)
                            }
                            .padding(10)
                            Divider()
                                .background(.gray)
                                .frame(height: 75)
                            VStack{
                                Text("Age")
                                    .bold()
                                    .font(Font.custom("Saira SemiCondensed", size: 19))
                                    .padding(2)
                                Text(game.age)
                                    .font(Font.custom("Saira SemiCondensed", size: 12))
                                    .fontWeight(.medium)
                            }
                        }.padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                }
                
                
                
                VStack{
                    //GameDescription
                    Text("Text About")
                        .font(Font.custom("Saira SemiCondensed", size: 20))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(2)
                    Text(game.about)
                        .font(Font.custom("Saira SemiCondensed", size: 12))
                        .fontWeight(.regular)
                    
                    
                    //تعديل اليوم
                    HStack{
                        //                    Spacer()
                        
                        Text("Text Reviews")
                            .font(Font.custom("Saira SemiCondensed", size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(15)
                        
                        Spacer()
                        NavigationLink(
                            destination: CommentView(game: game)) {
                                
                                Text("Text Seeall")
                                
                                    .frame(maxWidth: .infinity,alignment: .trailing)
                                    .padding(12)
                                
                            }.buttonStyle(.plain)
                        
                    }
                    
                    
                }
            }
            
            
            .padding(.horizontal)
        }
        
    }
    
}


struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(page == currentPage ? .blue : .gray)
            }
        }
    }
}
