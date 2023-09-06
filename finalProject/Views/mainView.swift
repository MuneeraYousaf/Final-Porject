//
//  mainView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI
enum TobBarSection:String, CaseIterable{
    
    case home
    case list
    case profile
    
    var imageName : String {
        
        switch self {
            
        case .home:
            return "house"
        case .list:
            return "list.dash"
        case .profile:
            return "person.fill"
        }
    }
}
struct mainView: View {
    @State var selectedView:TobBarSection = .home
    var body: some View {
        NavigationView{
            TabView(selection: $selectedView){
                switch selectedView {
                case .home:
                    HomeView()
                case .list:
                    ListView()
                case .profile:
                    ProfileView()
                }
            }.tabViewStyle(.page(indexDisplayMode:.never))
                .overlay(alignment:.bottom){
                    HStack{
                        ForEach(TobBarSection.allCases,id:\.self){ tabSection in
                            Spacer()
                            Button {
                                withAnimation{
                                    selectedView = tabSection
                                }
                            } label: {
                                Image(systemName: tabSection.imageName)
                                //                                    .clipShape(Circle())
                                //                                    .cornerRadius(9)
                                //                                    .border(.white)
                                    .foregroundColor(selectedView == tabSection ? .white: .white)
                                    .scaleEffect(selectedView == tabSection ? 1.7:1)
                                    .imageScale(.medium)
                                    .bold()
                                
                                
                            }
                            Spacer()
                        }
                    }
                    
//                                    .frame( height: 100 )
//                                    .cornerRadius(16)
//                                    .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
                                    
                                    .frame(width:370, height: 60 )
                                    .background(RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684)))
                                    .shadow(radius: 5,x:0,y:4)
                                   
                    
                }
        }
    }
}

struct mainViwe_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
