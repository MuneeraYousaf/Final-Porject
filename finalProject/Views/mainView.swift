//
//  mainView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct mainView: View {
    @State private var activeTab: Tab = . home
    @Namespace private var animation
    
    init(){UITabBar.appearance () . isHidden = true}
    
    var body: some View {
        NavigationView{
        ZStack{
            VStack {
                TabView(selection: $activeTab){
                    HomeView()
                        .tag(Tab.home)
                    ListView()
                        .tag(Tab.list)
                    ProfileView()
                        .tag(Tab.profile)
                }
                CustomTabBar()
            }
        }
        }
        .buttonStyle(.plain)
    }
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color.white, _ inactiveTint: Color = .gray) ->   some View {
        HStack(alignment: .bottom){
            ForEach(Tab.allCases , id: \.rawValue){
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0 ,
                        animation: animation,
                        activeTab: $activeTab)
//                .padding()
            }
        }
        .frame(height: 80 )
        .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))

        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration:
                                        0.7), value: activeTab)
        .cornerRadius(100)
        .padding()
       
    }
}


struct CustomTapBar_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    var body: some View{
        
        VStack{
            Image(systemName: tab.systemImage)
                .font (.title2)
                .foregroundColor (activeTab == tab ? .black : .gray)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58: 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        
                    }
                }
            
            //            Text(tab.rawValue)
            //                .font(.caption)
            //                .foregroundColor(activeTab == tab ? tint : .gray)
            
        
    }
        .frame(maxWidth: .infinity)
        .contentShape (Circle())
        .onTapGesture {
            activeTab = tab
            
        }
        
    }
}
enum Tab: String, CaseIterable {
    case home = "Home"
    case list = "List"
    case profile = "Profile"


    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .list:
            return "list.dash"
        case .profile:
            return "person.fill"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex (of: self) ?? 0
    }
    
}
//enum TobBarSection:String, CaseIterable{
//
//    case home
//    case list
//    case profile
//
//    var imageName : String {
//
//        switch self {
//
//        case .home:
//            return "house"
//        case .list:
//            return "list.dash"
//        case .profile:
//            return "person.fill"
//        }
//    }
//}
//struct mainView: View {
//    @State var selectedView:TobBarSection = .home
//    var body: some View {
//        NavigationView{
//            TabView(selection: $selectedView){
//                switch selectedView {
//                case .home:
//                    HomeView()
//                case .list:
//                    ListView()
//                case .profile:
//                    ProfileView()
//                }
//            }.tabViewStyle(.page(indexDisplayMode:.never))
//                .overlay(alignment:.bottom){
//                    HStack{
//                        ForEach(TobBarSection.allCases,id:\.self){ tabSection in
//                            Spacer()
//                            Button {
//                                withAnimation{
//                                    selectedView = tabSection
//                                }
//                            } label: {
//                                Image(systemName: tabSection.imageName)
//                                //                                    .clipShape(Circle())
//                                //                                    .cornerRadius(9)
//                                //                                    .border(.white)
//                                    .foregroundColor(selectedView == tabSection ? .white: .white)
//                                    .scaleEffect(selectedView == tabSection ? 1.7:1)
//                                    .imageScale(.medium)
//                                    .bold()
//
//
//                            }
//                            Spacer()
//                        }
//                    }
//
////                                    .frame( height: 100 )
////                                    .cornerRadius(16)
////                                    .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
//
//                                    .frame(width:370, height: 60 )
//                                    .background(RoundedRectangle(cornerRadius: 20)
//                                        .fill(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684)))
//                                    .shadow(radius: 5,x:0,y:4)
//
//
//                }
//        }
//    }
//}
//
//struct mainView_Previews: PreviewProvider {
//    static var previews: some View {
//        mainView()
//    }
//}
