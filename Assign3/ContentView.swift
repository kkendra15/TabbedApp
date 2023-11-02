//
//  ContentView.swift
//  Assign3
//
//  Created by Kendra Ferguson on 10/27/23.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        TabView {
            
            TempView()
                .tabItem {
                    Label("Temperature", image: "Temperature")
                }
            
            LoanView()
                .tabItem {
                    Label("Mortgage", image: "House")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
