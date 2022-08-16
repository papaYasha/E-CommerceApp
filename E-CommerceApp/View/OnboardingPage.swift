//
//  OnboardingPage.swift
//  E-CommerceApp
//
//  Created by Macbook on 16.08.22.
//

import SwiftUI

struct OnboardingPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Find your\nGadget")
                .font(.custom(Constants.ralewayRegular, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image(Constants.superHeroImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button(action: {
                
            }, label: {
                Text("Get started")
                    .font(.custom(Constants.ralewayRegular, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 3, y: 3)
                    .foregroundColor(Color(Constants.purpleColor))
            })
            .padding(.horizontal, 30)
            .padding(.top, getScreenBound().height < 750 ? 0 : 20)
            .offset(y: getScreenBound().height < 750 ? 20 : 40)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(Constants.purpleColor)
                .ignoresSafeArea()
        )
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage()
    }
}

extension View {
    func getScreenBound() -> CGRect {
        return UIScreen.main.bounds
    }
}
