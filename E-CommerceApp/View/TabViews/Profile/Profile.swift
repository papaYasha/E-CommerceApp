//
//  Profile.swift
//  E-CommerceApp
//
//  Created by Admin on 3.09.22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {

                VStack {
                    Text("My Profile")
                        .font(.custom(Constants.ralewayRegular, size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 15) {
                        AvatarImage()
                            .offset(y: -30)
                            .padding(.bottom, -30)
                        Text("Derek Rose")
                            .font(.custom(Constants.ralewayRegular, size: 16))
                            .fontWeight(.semibold)

                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            Text("Addres: 43 Oxford Road\nM13G43\nNY, USA")
                                .font(.custom(Constants.ralewayRegular, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal, .bottom])
                    .background(
                        Color.white
                            .cornerRadius(15)
                    )
                    .padding()
                    .padding(.top, 40)

                    customNavigationLink(title: "Edit Profile") {
                        Text("")
                            .navigationTitle("Edit Profile")
                            .background(
                                Color(Constants.homeBackground).ignoresSafeArea())
                    }
                    customNavigationLink(title: "Shopping address") {
                        Text("")
                            .navigationTitle("Shopping address")
                            .background(
                                Color(Constants.homeBackground).ignoresSafeArea())
                    }
                    customNavigationLink(title: "Cards") {
                        Text("")
                            .navigationTitle("Cards")
                            .background(
                                Color(Constants.homeBackground).ignoresSafeArea())
                    }
                    customNavigationLink(title: "Order history") {
                        Text("")
                            .navigationTitle("Order history")
                            .background(
                                Color(Constants.homeBackground).ignoresSafeArea())
                    }
                    customNavigationLink(title: "Notifications") {
                        Text("")
                            .navigationTitle("Notifications")
                            .background(
                                Color(Constants.homeBackground).ignoresSafeArea())
                    }
                    customNavigationLink(title: "Privacy") {
                        Text("")
                            .navigationTitle("Privacy")
                            .background(
                                Color(Constants.homeBackground).ignoresSafeArea())
                    }

                }
                .padding(.horizontal, 22)
                .padding(.vertical, 20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(Constants.homeBackground)
                    .ignoresSafeArea()
            )
        }
    }

    @ViewBuilder
    func customNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping ()-> Detail) -> some View {

        NavigationLink {
            content()
        } label: {

            HStack {
                Text(title)
                    .font(.custom(Constants.ralewayRegular, size: 17))
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
