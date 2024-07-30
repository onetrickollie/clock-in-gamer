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
    @ObservedObject var theUser = User(bio: "Hello", name: "Victor", discordLink: "", steamUserName: "", xboxUserName: "", status: StatusType.CLOCKEDIN, points: 100, type: GamerType.RELIABLE, isClockedIn: false)
    @ObservedObject var appData = AppData(User(bio: "Hello", name: "Victor", discordLink: "", steamUserName: "", xboxUserName: "", status: StatusType.CLOCKEDIN, points: 100, type: GamerType.RELIABLE, isClockedIn: false))
    
    init() {
    }

    var body: some View {
        Login()
            .environmentObject(theUser)
            .environmentObject(appData)
    }
}



#Preview {
    ContentView()
}
