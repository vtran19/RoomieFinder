//
//  ContentView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/22/22.
//

import SwiftUI

// Overall view
struct ContentView: View {
    // Boolean value for whether or not to show feed
    @State var screen = "login"
    
    var body: some View {
        // Shows screen according to boolean showFeed
        if screen == "login" {
            LoginView(screen: $screen)
        } else {
            FeedView(screen: $screen)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
