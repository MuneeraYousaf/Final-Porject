//
//  SignIn.swift
//  ThreadsClone
//
//  Created by Muneera Y on 13/02/1445 AH.
//

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    @State var emails: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    @State var showNextPage: Bool = false
    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView()
                if showNextPage == true{
                    mainView()
                        .onAppear(){
                            
                            gamesData.fetchGames()
                            gamesData.fetchFavoriteGames()
                            
                        }
                    
                }else{
                    
                    VStack {
                        Spacer()
           
                        VStack(){

                            Image("logo")
                            
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 150, alignment: .center)
                            Text("Games Vault")
                                .font(
                                    .custom(
                                        "Saira SemiCondensed",
                                        fixedSize: 35)
                                    .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.163, green: 0.289, blue: 0.514)).padding(-28)
                        }
                        .padding()
                        Spacer()
                        TextField("Text1", text: $emails).padding(.leading)
                            .frame(width: 360, height: 60).background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)).cornerRadius(7)
             
                        SecureField("Text2", text: $password)
                            .padding(.leading)
                            .frame(width: 360, height: 60)
                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                            .cornerRadius(7)
                            .padding()
                        Button(action: {
                            //
                            signIn(emails, password)
                        }, label: {
                            Text("Text3")
                                .frame(width: 360, height: 60)
                                .font(Font.custom("Saira SemiCondensed", size: 20))
                                .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        })
                        Spacer()
                        HStack{
                            Text("Text4")
                                .font(Font.custom("Saira SemiCondensed", size: 15))
                            NavigationLink(
                                destination: SignUp()
                            ) {
                                Text("Text5")
                                    .font(Font.custom("Saira SemiCondensed", size: 15))
                            }.buttonStyle(.plain)
                                .foregroundColor(.blue)
                            
                        }
                        
                    }
                    
                }
                
                
            }
        } .navigationBarBackButtonHidden(true)
    }
    // Function for signing in with email and password
    func signIn(_ email: String, _ pass: String) {
        // Use Firebase Authentication to sign in with the provided email and password
        Auth.auth().signIn(withEmail: email, password: pass) { result, errors in
            if errors != nil {
                print("Error occurred during sign-in.")
            }
            else if let user = result?.user {
                showNextPage = true
                
                print("User's Email: \(email)")
                
            }
        }
    }
    
    // Function for authentication, checking if passwords match, and triggering sign-in
    func authentication(_ password: String, _ rpassword: String, _ email: String) {
        if password == rpassword {
            // If passwords match, call the sign-in function with the provided email and password
            print("Passwords match.")
            signIn(email, password)
        } else {
            // If passwords don't match, handle the mismatch
            print("Passwords do not match.")
        }
    }
    
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
