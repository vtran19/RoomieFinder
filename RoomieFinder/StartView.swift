//
//  StartView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

// Login view screen
struct StartView: View {
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Button("LOG IN") {
                self.screen = "login"
            }
            Button("SIGN UP") {
                self.screen = "signup"
            }
        }
        .buttonStyle(BlueButton())
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

struct Previews_StartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "start")
    }
}
