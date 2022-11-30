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
            Image("logo")
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
        .buttonStyle(BlueButton())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .accentColor(gray)
        .background(eggshell)
    }
}

struct Previews_StartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "start")
    }
}
