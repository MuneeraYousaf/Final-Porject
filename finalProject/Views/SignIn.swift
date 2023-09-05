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
                    TextField("Enter Email", text: $email).padding(.leading)
                        .frame(width: 360, height: 60).background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)).cornerRadius(7)
                    //                        .padding()
                    //                        .position(x: 200, y: 445)
                        
                    SecureField("Enter Password", text: $password) .padding(.leading).frame(width: 360, height: 60).background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)).cornerRadius(7)
                    //                SecureField("Enter rePassword", text: $repassword)
                        .padding()
                    Button(action: {
                        //
                        signIn(email, password)
                    }, label: {
                        Text("Sign in ").frame(width: 360, height: 60).background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684)).foregroundColor(.white)
                            .cornerRadius(16)
                    })
                    Spacer()
                    HStack{
                        Text("New User?")
                        Button(action: {
                            //                    SignUp()
                            
                        }, label: {
                            Text("SignUp")
                        })
                        
                    }
                    Button(action: {
                        //                    SignUp()
                        
                    }, label: {
                        Text("Centnue as Gusst").foregroundColor(.black)
                    })
                    
                }
                
            }
        }
        
    }
    func signIn(_ email: String, _ pass: String){
        Auth.auth().signIn(withEmail: email, password: pass) { result, errors in
            if errors != nil {
                print("error")
            
            }else
            {
//                print("s")
                showNextPage = true
            }
            
            
        }
        
    }
    func authentication(_ password: String, _ rpassword: String, _ email: String){
        if password == rpassword{
            print("samee")
            signIn(email, password)
        }
        else{
            print("wrong")
        }
        
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
