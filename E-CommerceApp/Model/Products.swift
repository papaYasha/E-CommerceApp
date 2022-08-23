//
//  Products.swift
//  E-CommerceApp
//
//  Created by Macbook on 23.08.22.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productName: String = ""
    var quantity: Int = 1
}

enum ProductType: String, CaseIterable {
    case wearable = "Wearable"
    case laptops = "Laptops"
    case phones = "Phones"
    case tablets = "Tablets"
}
