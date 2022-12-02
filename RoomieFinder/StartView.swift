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
            Image("logo_with_name")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 250.0, height: 250.0, alignment: .center)
                 .clipped()
            Button("LOG IN") {
                self.screen = "login"
            }
            Button("SIGN UP") {
                self.screen = "signup"
            }
        }
        .buttonStyle(OrangeButton())
        .padding()
        .padding(.bottom, 60)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .accentColor(gray)
        .background(cream)
    }
}

struct Previews_StartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "start")
    }
}
