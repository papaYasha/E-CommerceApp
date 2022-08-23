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
    
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    //Log Status
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // Login call
    
    func login() {
        withAnimation {
            log_Status = true
        }
    }
    
    func register() {
        withAnimation {
            log_Status = true
        }
    }
    
    func forgotPassword() {
        
    }
}
