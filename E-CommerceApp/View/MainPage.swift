//
//  MainPage.swift
//  E-CommerceApp
//
//  Created by Macbook on 20.08.22.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                content:  {
                    Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
                    Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
                })
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

enum Tab: String {
    case Home = "Home"
    case Profile = "Profile"
    case Cart = "Cart"
    case Liked = "Liked"
}
