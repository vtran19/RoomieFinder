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
            Button(action: {
                self.screen = "login"
            }) {
                HomeButton()
            }
        }
    }
}

struct HomeButton: View {
    var body: some View {
        return Text("HOME")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}
