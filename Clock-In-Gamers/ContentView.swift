//
//  ContentView.swift
//  Clock-In-Gamers
//
//  Created by KaixiangLiu on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    // Usernames array
    @State private var users: [User] = []

    @State private var isClockedIn = false
//    @ObservedObject var theUser = User(bio: "Hello", name: "Victor", discordLink: "", steamUserName: "", xboxUserName: "", status: StatusType.CLOCKEDIN, points: 100, type: GamerType.RELIABLE, isClockedIn: false)
    @ObservedObject var appData = AppData()
    @StateObject var authManager = AuthManager()
    
    init() {
        appData.loadData()
    }

    var body: some View {
        if authManager.isAuthenticated {
            AppNavigation()
                .environmentObject(appData)
                .environmentObject(authManager)
        } else {
            Login()
                .environmentObject(appData)
                .environmentObject(authManager)
        }
    }
}



#Preview {
    ContentView()
}
