//
//  CircleAvatar.swift
//  E-CommerceApp
//
//  Created by Admin on 3.09.22.
//

import SwiftUI

struct AvatarImage: View {
    var body: some View {
        Image(Constants.avatarImage)
            .resizable()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}

struct AvatarImage_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImage()
    }
}
