//
//  Home.swift
//  E-CommerceApp
//
//  Created by Macbook on 23.08.22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                HStack(spacing: 15) {
                    Image(systemName: Constants.magnifyingglass)
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.gray, lineWidth: 0.8)
                )
                .frame(width: getScreenBound().width / 1.6)
                .padding(.horizontal, 25)
                
                Text("Order online\ncollect in store")
                    .font(.custom(Constants.ralewayRegular, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18) {
                        
                        ForEach(ProductType.allCases,id: \.self) { type in
                            productTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Constants.homeBackground).ignoresSafeArea())
    }
    
    @ViewBuilder
    func productTypeView(type: ProductType) -> some View {
        
        Button {
            
        } label: {
            Text(type.rawValue)
                .font(.custom(Constants.ralewayRegular, size: 15))
                .fontWeight(.semibold)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
