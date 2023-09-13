
import SwiftUI
struct OnBoarding {
    let image :String
    let titel : String
    let description : String
}
private let OnBoardingStep = [
    OnBoarding(image: "OnBoarding1", titel: "Gaming Community", description: "The application consolidates all the games in a single platform"),
    OnBoarding(image: "OnBoarding2", titel: "Reviews", description: "Viewing all the comments  and reviews on a game.")
    //    OnBoarding(image: "OnBoarding11", titel: "", description: "")
    
]

struct Onbording: View {
    @State private var isOnboardingComplete = false
    @State private var currentStep = 0
    var body: some View {
        NavigationView{
            
            ZStack {
                BackgroundView()
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.currentStep = OnBoardingStep.count - 1
                        }){
                            Text("Skip")
                                .padding(16)
                                .foregroundColor(.gray)
                        }
                    }
                    TabView(selection:$currentStep){
                        ForEach(0..<OnBoardingStep.count,id:\.self){ it in
                            VStack{
                                Image(OnBoardingStep[it].image)
                                    .resizable()
                                    .frame(width: 350,height: 350)
                                    .padding(.horizontal, 32)
                                    .padding(.top, 16)
                                
                                Text(OnBoardingStep[it].titel)
                                    .font(Font.custom("Saira SemiCondensed", size: 30))
                                //                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514))
                                
                                
                                Text(OnBoardingStep[it].description)
                                    .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 32)
                                
                                
                            }
                            .tag(it)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode:.never))
                    HStack{
                        ForEach(0..<OnBoardingStep.count,id:\.self){ it in
                            if it == currentStep{
                                Rectangle()
                                    .frame(width: 20,height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
                                
                            } else{
                                Circle()
                                    .frame(width: 20,height: 10)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Button(action: {
                        if self.currentStep < OnBoardingStep.count - 1 {
                            self.currentStep += 1
                        } else {
                            self.isOnboardingComplete = true
                        }
                    }){
                        Text(currentStep < OnBoardingStep.count - 1 ? "Next" :"Get started")
                            .frame(width: 360, height: 60)
                            .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(
                        destination: SignIn(),
                        isActive: $isOnboardingComplete,
                        label: { EmptyView() }
                    )
                    
                    
                }
            }
        }
    }
    
}

