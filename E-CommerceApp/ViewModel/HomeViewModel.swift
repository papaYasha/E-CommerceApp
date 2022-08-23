//
//  HomeViewModel.swift
//  E-CommerceApp
//
//  Created by Macbook on 23.08.22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .wearable
    
    //Sample products
    @Published var products: [Product] = [
        //Watches
        Product(type: .wearable, title: "Apple Watch", subtitle: "Series 6: White", price: "$359", productImage: "appleWatch6"),
        Product(type: .wearable, title: "Apple Watch", subtitle: "Series 4: Red", price: "$259", productImage: "appleWatch4"),
        Product(type: .wearable, title: "Apple Watch", subtitle: "Series 2: Black", price: "$159", productImage: "appleWatch2"),
        
        //Phones
        Product(type: .phones, title: "iPhone XR", subtitle: "A12 - Blue", price: "$399", productImage: "iphoneXR"),
        Product(type: .phones, title: "iPhone 11", subtitle: "A13 - Silver", price: "$499", productImage: "iphone11"),
        Product(type: .phones, title: "iPhone 12", subtitle: "A14 - Purple", price: "$599", productImage: "iphone12"),
        Product(type: .phones, title: "iPhone 13", subtitle: "A15 - Blue", price: "$699", productImage: "iphone13"),
        
        //Laptops
        Product(type: .laptops, title: "MacBook Pro", subtitle: "M2 - Silver", price: "$1299", productImage: "macBookPro"),
        Product(type: .laptops, title: "MacBook Air", subtitle: "M1 - Silver", price: "$999", productImage: "macBookAir"),
        
        //Tablets
        Product(type: .tablets, title: "Samsung S13", subtitle: "G7 - Black", price: "$299", productImage: "tabletSamsung"),
        Product(type: .tablets, title: "iPad Pro 2021", subtitle: "M1 - Black", price: "$799", productImage: "ipadPro2020"),
        Product(type: .tablets, title: "iPad Air 2019", subtitle: "i7 - White", price: "$499", productImage: "ipadAir2019"),
    ]
    
    @Published var filtredProducts: [Product] = []
    
    @Published var showMoreProductsOnType: Bool = false
    
    init() {
        filterProductByType()
    }
    
    func filterProductByType() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
                .prefix(4)
            DispatchQueue.main.async {
                self.filtredProducts = result.compactMap({ product in
                    return product
                })
            }
        }
    }
}
