//
//  Profile.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/27/24.
//

import SwiftUI

struct Profile: View {
    @State var game : String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("You are in Profile")
                }
                VStack {
                    TextField("Insert Game: ", text: $game)
                        .background(Color.white)
                        .foregroundColor(.black)
                }
                .padding(20)
            }
            .modifier(MainBackground())
        }
    }
}

#Preview {
    Profile()
}
