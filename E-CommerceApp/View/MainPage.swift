//
//  MainPage.swift
//  E-CommerceApp
//
//  Created by Macbook on 20.08.22.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                
                Home()
                    .tag(Tab.home)
                Text("Liked")
                    .tag(Tab.liked)
                Text("Profile")
                    .tag(Tab.profile)
                Text("Cart")
                    .tag(Tab.cart)
            }
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    
                    Button {
                        currentTab = tab
                    } label: {
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 25)
                            .background(
                                Color(Constants.purpleColor)
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color(Constants.purpleColor) : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

enum Tab: String, CaseIterable {
    case home = "Home"
    case profile = "Profile"
    case cart = "Cart"
    case liked = "Liked"
}
