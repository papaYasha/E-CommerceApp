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
                    }
                )
            
            ScrollView(.vertical) {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white
                            .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Constants.purpleColor)).ignoresSafeArea()
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
