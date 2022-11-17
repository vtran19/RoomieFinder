/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI

struct FeedView: View {
    // Binds showFeed to State in Content View
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Text("You logged in!")
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
