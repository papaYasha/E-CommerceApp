//
//  Home.swift
//  E-CommerceApp
//
//  Created by Macbook on 23.08.22.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25) {
                        
                        ForEach(homeData.filtredProducts) { product in
                            productCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Constants.homeBackground).ignoresSafeArea())
        .onChange(of: homeData.productType) { newValue in
            homeData.filterProductByType()
        }
    }
    
    @ViewBuilder
    func productCardView(product: Product) -> some View {
        VStack(spacing: 10) {
            
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getScreenBound().width / 2.5, height: getScreenBound().width / 2.5)
                .offset(y: -80)
                .padding(.bottom, -70)
            
            Text(product.title)
                .font(.custom(Constants.ralewayRegular, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subtitle)
                .font(.custom(Constants.ralewayRegular, size: 18))
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.custom(Constants.ralewayRegular, size: 16))
                .foregroundColor(Color(Constants.purpleColor))
                .fontWeight(.bold)
                .padding(.top, 5)
        }
        .padding(.horizontal, 25)
        .padding(.vertical , 22)
        .background(
            
            Color.white
                .cornerRadius(25)
        )
    }
    
    @ViewBuilder
    func productTypeView(type: ProductType) -> some View {
        
        Button {
            withAnimation {
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(Constants.ralewayRegular, size: 15))
                .fontWeight(.semibold)
                .foregroundColor(homeData.productType == type ? Color(Constants.purpleColor) : Color.gray)
                .padding(.bottom, 10)
            
                .overlay(
                    ZStack {
                        if homeData.productType == type {
                            Capsule()
                                .fill(Color(Constants.purpleColor))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal, -5)
                    ,alignment: .bottom
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
