//
//  PreviewProfileView.swift
//  RoomieFinder
//
//  Created by Stephanie Godes on 11/25/22.
//


import SwiftUI



struct PreviewProfileView: View {
    
    @Binding var screen: String
    
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var location: String
    @Binding var bio: String
    
    var body: some View {
        VStack {
            Button("Edit Profile"){
                self.screen = "editprofile"
            }
            .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8,
                   maxHeight: UIScreen.main.bounds.size.height * 0.1, alignment: .topLeading)
            .font(.title2)
            Text("\(firstname) \(lastname)")
                .font(.largeTitle)
            Text("Location: \(location)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.blue)
            Text("\(bio)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.pink)
            Spacer()
        }
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("beige"))
    }
}

struct Previews_PreviewProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "viewprofile")
    }
}
