//
//  LoginPageViewModel.swift
//  E-CommerceApp
//
//  Created by Macbook on 16.08.22.
//

import SwiftUI

class LoginPageViewModel: ObservableObject {
    
    //Login Propertries
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register Properties
    
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    // Login call
    
    func login() {
        
    }
    
    func register() {
        
    }
    
    func forgotPassword() {
        
    }
}
