//
//  SignIn.swift
//  ThreadsClone
//
//  Created by Muneera Y on 13/02/1445 AH.
//

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    @State var showNextPage: Bool = false
    var body: some View {
        ZStack{
            BackgroundView()
            if showNextPage == true{
                
                Text("hello")
            }else{
                VStack {
//                    HStack{
//                    Image(systemName: "swift")
                    Spacer()
                    TextField("Text1", text: $email).padding(.leading)
                        .frame(width: 360, height: 60).background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)).cornerRadius(7)
                    //                        .padding()
                    //                        .position(x: 200, y: 445)
                        
                    SecureField("Text2", text: $password) .padding(.leading).frame(width: 360, height: 60).background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)).cornerRadius(7)
                    //                SecureField("Enter rePassword", text: $repassword)
                        .padding()
                    Button(action: {
                        //
                        signIn(email, password)
                    }, label: {
                        Text("Text3").frame(width: 360, height: 60).background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684)).foregroundColor(.white)
                            .cornerRadius(16)
                    })
                    Spacer()
                    HStack{
                        Text("Text4")
                        Button(action: {
                            //                    SignUp()
                            
                        }, label: {
                            Text("Text5")
                        })
                        
                    }
                    Button(action: {
                        //                    SignUp()
                        
                    }, label: {
                        Text("Text6").foregroundColor(.black)
                    })
                    
                }
                
            }
        }
        
    }
    // Function for signing in with email and password
    func signIn(_ email: String, _ pass: String) {
        // Use Firebase Authentication to sign in with the provided email and password
        Auth.auth().signIn(withEmail: email, password: pass) { result, errors in
            if errors != nil {
                // Handle and print any sign-in errors
                print("Error occurred during sign-in.")
            } else {
                // Sign-in was successful, set a flag to show the next page
                showNextPage = true
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
