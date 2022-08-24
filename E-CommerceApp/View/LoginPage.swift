//
//  LoginPage.swift
//  E-CommerceApp
//
//  Created by Macbook on 16.08.22.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageViewModel = LoginPageViewModel()
    
    var body: some View {
        
        VStack {
            Text("Welcome\nback")
                .font(.custom(Constants.ralewayRegular, size: 55).bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getScreenBound().height / 3.5)
                .padding()
                .background(
                    
                    ZStack {
                        LinearGradient(gradient: Gradient(colors:
                                                            [Color("CircleLogin"),
                                                             Color("CircleLogin")
                                                                .opacity(0.8),
                                                             Color("Purple")
                                                            ]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding()
                            .ignoresSafeArea()
                            .offset(y: -40)
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(30)
                    }
                )
            
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.custom(Constants.ralewayRegular, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "yaroshworkspace@gmail.com", value: $loginData.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "12345", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    
                    if loginData.registerUser {
                        CustomTextField(icon: "envelope", title: "Re-Enter Password", hint: "12345", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    
                    Button(action: {
                        loginData.forgotPassword()
                    }, label: {
                        Text("Forgot password?")
                            .font(.custom(Constants.ralewayRegular, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(Constants.purpleColor))
                    })
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Button(action: {
                        if loginData.registerUser {
                            loginData.register()
                        } else {
                            loginData.login()
                        }
                    }, label: {
                        Text("Login")
                            .font(.custom(Constants.ralewayRegular, size: 18).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color(Constants.purpleColor))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.25), radius: 5, x: 5, y: 5)
                    })
                    .padding(.top, 50)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        withAnimation {
                            loginData.registerUser.toggle()
                        }
                    }, label: {
                        Text(loginData.registerUser ? "Back to login" : "Create account")
                            .font(.custom(Constants.ralewayRegular, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(Constants.purpleColor))
                    })
                    .padding(.top, 10)
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white
                            .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Constants.purpleColor)).ignoresSafeArea()
        
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.custom(Constants.ralewayRegular, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue {
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            Divider()
                .background(Color.black.opacity(0.4))
        }
        
        .overlay(
            
            Group {
                
                if title.contains("Password") {
                    
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(Constants.ralewayRegular, size: 13).bold())
                            .foregroundColor(Color(Constants.purpleColor))
                    })
                    .offset(y: 8)
                }
            }
            ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
