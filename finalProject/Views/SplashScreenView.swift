//
//  SplashScreenView.swift
//  finalProject
//
//  Created by Afrah Faisal on 24/02/1445 AH.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
       @State private var size = 0.8
       @State private var opacity = 0.5
       
    var body: some View {
        if isActive {
            mainView()
        } else {
            ZStack {

                VStack {
              
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
//                        .font(.system(size: 40))
                    Text("Games Vault")
                        .font(Font.custom("Baskerville-Bold", size: 26))
//                        .foregroundColor(.black.opacity(0.80))
                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514))
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
                VStack{
                    Spacer()
                    Text("by")
                        .font(Font.custom("Baskerville-Bold", size: 18))
                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514))
                        .padding(3)
                    Text("SMA")
                        .font(Font.custom("Baskerville-Bold", size: 18))
                        .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514))
                    
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}


