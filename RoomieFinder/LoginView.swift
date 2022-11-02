/**
    Login View Screen for user login into Roomie FInder
 */


import SwiftUI

// Login view screen
struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
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
            Button(action: {
                //TODO: add logic for authentication here or function
                print("Logged In")
                self.screen = "feed"
                }) {
                LoginButton()
            }
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

// Login button styling
struct LoginButton : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}
