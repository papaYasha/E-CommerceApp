//
//  ContentView.swift
//  E-CommerceApp
//
//  Created by Macbook on 16.08.22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        
        Group {
            if log_Status {
                MainPage()
            } else {
                 OnboardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
