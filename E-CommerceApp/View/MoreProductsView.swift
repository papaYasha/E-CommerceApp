//
//  MoreProductsView.swift
//  E-CommerceApp
//
//  Created by Macbook on 23.08.22.
//

import SwiftUI

struct MoreProductsView: View {
    var body: some View {
        
        VStack {
            Text("More Products")
                .font(.custom(Constants.ralewayRegular, size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(Constants.homeBackground).ignoresSafeArea())
    }
}

struct MoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductsView()
    }
}
