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
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color(Constants.homeBackground).ignoresSafeArea()
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
