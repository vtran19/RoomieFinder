//
//  ContentView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LoginView()
                .tabItem{
                    Label("login", systemImage: "person")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
