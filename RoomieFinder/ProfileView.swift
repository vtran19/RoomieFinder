//
//  ProfileView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

struct ProfileView: View {
    // Binds showFeed to State in Content View
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Text("this is your profile woohoo")
                .bold()
            Button("CHAT") {
                //TODO: add logic for authentication here or function
                print("Chat");
                self.screen = "chat";
                }
            .buttonStyle(BlueButton())
        }
            
        }
    }
