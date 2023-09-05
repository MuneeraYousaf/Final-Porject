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
    @EnvironmentObject var userData: UserDataViewModel
    var body: some View {
        
        ZStack{
            BackgroundView()
            if showNextPage == true{
                
                Text("hello")
            }else{
                VStack {
                    Spacer()
                    Text("Create Account")
                        .font(Font.custom("BodoniFLF-BoldItalic", size: 34))
                        .padding(.vertical, 40)
           
                    VStack{
                        TextField("User Name", text: $userName)
                            .padding(.leading)
                            .frame(width: 360, height: 60)
                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                            .cornerRadius(7)
                        //                        .keyboardType(.phonePad)
                            .padding(.vertical,8)
                        
                        TextField("Email @example.com", text: $email)
                            .padding(.leading)
                            .frame(width: 360, height: 60)
                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                        
                            .cornerRadius(7)
                            .padding(.vertical,8)
                        
                        TextField("Namber", text: $phone)
                            .padding(.leading)
                            .frame(width: 360, height: 60)
                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                            .cornerRadius(7)
                            .padding(.vertical,10)
                        
                        SecureField("Password", text: $password)
                            .padding(.leading)
                            .frame(width: 360, height: 60)
                            .background(Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902))
                            .cornerRadius(7)
                            .padding(.vertical,8)
                        
                        
                        
                        HStack{
                          
                            SecureField("Confirm Password", text: $repassword)
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
                        Text("SIGN UP ").frame(width: 360, height: 60).background(Color(red: 0.09803921568627451, green: 0.21568627450980393, blue: 0.42745098039215684)).foregroundColor(.white)
                            .cornerRadius(16)
                    }).padding(.vertical, 40)
                    Spacer()
                    HStack{
                        Text("Do you have account?")
                        Button(action: {
                            //                    SignUp()
                            
                        }, label: {
                            Text("SIGN IN")
                        })
                        
                    }
//                    Button(action: {
//                        //                    SignUp()
//
//                    }, label: {
//                        Text("Centnue as Gusst").foregroundColor(.black)
//                    })
                    
                }
                
            }
        }
        
    }
    func signUp(_ email: String, _ pass: String){
        Auth.auth().createUser(withEmail: email, password: pass) {  results, errors in
            if errors != nil {
                print("\(String(describing: errors))error")
            
            }else
            {
                print("succc")
                userData.addUser(username: userName, email: email, phone: phone, image: "")
                showNextPage = true
            }
            
            
        }
        
    }
    func authentication(_ password: String, _ rpassword: String, _ email: String){
        if password == rpassword{
            print("samee")
            signUp(email, password)
        }
        else{
            print("wrong")
        }
        
        
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

