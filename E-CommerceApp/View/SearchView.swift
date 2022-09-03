//
//  SearchView.swift
//  E-CommerceApp
//
//  Created by Macbook on 24.08.22.
//

import SwiftUI

struct SearchView: View {

    var animation: Namespace.ID

    @EnvironmentObject var homeData: HomeViewModel

    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 20) {
                
                Button {
                    withAnimation {
                        homeData.searchActivated = false
                    }
                    homeData.searchText = ""
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                HStack(spacing: 15) {
                    Image(systemName: Constants.magnifyingglass)
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $homeData.searchText)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color(Constants.purpleColor), lineWidth: 1.5)
                )
                        .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)

            if let products = homeData.searchedProducts {
                if products.isEmpty {
                    VStack(spacing: 10) {
                        Image("noResults")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text("Item Not Found")
                            .font(.custom(Constants.ralewayRegular, size: 22).bold())
                        Text("Try more genereic search term or try looking for altrnative products.")
                            .font(.custom(Constants.ralewayRegular, size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()

                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            Text("Found \(products.count) results")
                                .font(.custom(Constants.ralewayRegular, size: 24).bold())
                                .padding(.top)
                            StaggeredGrid(columns: 2, spacing: 20, list: products) { product in
                                productCardView(product: product)
                            }
                        }
                        .padding()
                    }

                }
            } else {
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color(Constants.homeBackground).ignoresSafeArea())
    }
}

@ViewBuilder
func productCardView(product: Product) -> some View {
    VStack(spacing: 10) {

        Image(product.productImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(y: -50)
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
    .padding(.top, 50)
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
