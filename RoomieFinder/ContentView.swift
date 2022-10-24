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
    @State var showFeed = false
    
    var body: some View {
        // Shows screen according to boolean showFeed
        if showFeed == false {
            LoginView(showFeed: $showFeed)
        } else {
            FeedView(showFeed: $showFeed)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
