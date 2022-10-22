//
//  LoginView.swift
//  RoomieFinder
//
//  Created by Emma Parzyck on 10/22/22.
//
import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Roomie Finder")
            TextField("Username", text: $username)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Password", text: $password)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
        .padding()
    }
}

struct LogintView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

