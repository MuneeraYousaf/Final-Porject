//
//  SignUp.swift
//  finalProject
//
//  Created by Muneera Y on 15/02/1445 AH.
//


import SwiftUI
import FirebaseAuth

struct SignUp: View {
    @State var email: String = ""
    @State var phone: String = ""
    @State var userName: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    @State var showNextPage: Bool = false
    @State private var signUpError: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gamesData: UserDataViewModel
    var body: some View {
//        NavigationView{
            ZStack{
                BackgroundView()
                if showNextPage == true{
                  
                    mainView().onAppear(){
                        if let user = Auth.auth().currentUser {
                                   // User is signed in, fetch their data
                            gamesData.fetchUsers()
    //                               fetchUserData()
                            
                            print(user.uid)
                               } else {
                                   // No user signed in, handle accordingly
                                   // For example, show a login screen
                               }
                    gamesData.fetchGames()
                    gamesData.fetchFavoriteGames()
                   
                }
//                    Text("hello")
                    
                }else{
                    VStack {
                        Spacer()
                        Text("Text8")
                            .font(Font.custom("Saira SemiCondensed", size: 34))
                            .padding(.vertical, 40)
                        
                        VStack{
                            TextField("Text9", text: $userName)
                                .padding(.leading)
                                .frame(width: 360, height: 60)
                                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                                .cornerRadius(7)
                            //                        .keyboardType(.phonePad)
                                .padding(.vertical,8)
                            
                            TextField("Text10", text: $email)
                                .padding(.leading)
                                .frame(width: 360, height: 60)
                                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                                .keyboardType(.emailAddress)
                                .cornerRadius(7)
                                .padding(.vertical,8)
                            
                            TextField("Text11", text: $phone)
                                .padding(.leading)
                                .frame(width: 360, height: 60)
                                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                                .cornerRadius(7)
                                .padding(.vertical,10)
                                .keyboardType(.numberPad)
                            
                            SecureField("Text12", text: $password)
                                .padding(.leading)
                                .frame(width: 360, height: 60)
                                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                                .cornerRadius(7)
                                .padding(.vertical,8)
                              
                            
                            
                            
                            HStack{
                                
                                SecureField("Text13", text: $repassword)
                                    .padding(.leading)
                                
                                    .cornerRadius(7)
                                    .padding(.vertical,8)
                                //                            Image(systemName: "person").frame(maxWidth: .infinity, alignment:.trailing).padding(.horizontal)
                            }     .frame(width: 360, height: 60)
                                .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                            
                        }
                        .padding(.vertical,23)
                        
                        Button(action: {
                            
                            authentication(password, repassword, email)
                        }, label: {
                            Text("Text15")
                                .frame(width: 360, height: 60)
                                .background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684))
                                .font(Font.custom("Saira SemiCondensed", size: 20))
                                .foregroundColor(.white)
                            
                                .cornerRadius(16)
                        }).padding(.vertical, 40)
                        Text(signUpError)
                        .foregroundColor(.red)
                        Spacer()
                        HStack{
                            Text("Text14")
                                Button(action: {
                                //                    SignUp()
                            dismiss()
                                }, label: {
                                Text("Text7")
                                        .font(Font.custom("Saira SemiCondensed", size: 15))
                                })
                    }
                    
                }
            }
        }
                    .navigationBarBackButtonHidden(true)
    }
    // Function for user registration (sign-up) using email and password
    func signUp(_ email: String, _ pass: String) {
        // Use Firebase Authentication to create a new user with the provided email and password
        Auth.auth().createUser(withEmail: email, password: pass) { result, error in
            if let error = error {
                // Handle and print any registration errors
                print("Error occurred during user registration: \(error.localizedDescription)")
                signUpError = error.localizedDescription
            } else if let user = result?.user {
                // Registration was successful, print a success message
                print("User registration successful.")
                
                // Access the user's UID
                let uid = user.uid
                
                // Now you can use the uid as needed, for example, adding it to your user management system
                gamesData.addUser(username: userName.lowercased(), email: email.lowercased(), phone: phone, image: "", userid: uid)
                
                // Set a flag to indicate that the next page should be shown
                showNextPage = true
            }
        }
    }


    // Function for authentication, checking if passwords match, and triggering user registration
    func authentication(_ password: String, _ rpassword: String, _ email: String) {
        if password == rpassword {
            // If passwords match, call the sign-up function with the provided email and password
            print("Passwords match.")
            signUp(email, password)
        } else {
            // If passwords don't match, handle the mismatch
            print("Passwords do not match.")
        }
    }

}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

