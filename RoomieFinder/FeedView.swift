/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI

struct FeedView: View {
    // Binds showFeed to State in Content View
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Text("You logged in! This is your feed.")
                .bold()
            Button("HOME") {
                self.screen = "login"
            }
            .buttonStyle(BlueButton())
            Button("PROFILE") {
                self.screen = "profile"
            }
            .buttonStyle(BlueButton())
        }
    }
}

struct Previews_FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "feed")
    }
}
