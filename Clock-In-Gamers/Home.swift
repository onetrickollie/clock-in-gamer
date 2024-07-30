//
//  Home.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/26/24.
//

import SwiftUI

struct Home: View, Hashable {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("You are in Home")
            }
            .modifier(MainBackground())
        }
    }
}

#Preview {
    Home()
}
