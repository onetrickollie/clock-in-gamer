//
//  AppNavigation.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/26/24.
//

import SwiftUI

struct AppNavigation: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                        .animation(.bouncy)
                    Text("Home")
                }
            Profile()
                .tabItem {
                    Image(systemName: "person.circle")
                        .animation(.bouncy)
                        .foregroundColor(.white)
                    Text("Profile")
                }
            Schedule()
                .tabItem {
                    Image(systemName: "calendar")
                        .animation(.bouncy)
                        .foregroundColor(.white)
                    Text("Schedule")
                }
        }
    }
}

#Preview {
    AppNavigation()
}
