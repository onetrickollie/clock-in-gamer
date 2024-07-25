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

    init() {
        // Load users from UserDefaults
        self._users = State(initialValue: ContentView.loadUsers())
    }

    var body: some View {
        NavigationView {
            VStack {
                // Top Greeting Message
                VStack(alignment: .leading, spacing: 10) {
                    Text(isClockedIn ? "Good day gamer, time to clock in" : "Good day gamer, time to clock out")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    if isClockedIn {
                        Text("Let's see your stats for today.")
                            .font(.subheadline)
                    } else {
                        Text("Ready to start another gaming session?")
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
                
                // Top Widget
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Today's Stats")
                                .font(.headline)
                            Text("Points Earned: 0")
                            Text("Lifetime Points: 1400")
                            // Add more text here as needed
                        }
                        Spacer()
                        Image(systemName: "gamecontroller.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // User List Header
                HStack {
                    VStack {
                        Text("Friend List")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    }
                    Spacer()
                }
                .padding()

                // Divider between two stacks
                Divider()
                    .background(Color.white)
                    .padding(.horizontal)

                // User List
                VStack(spacing: 20) {
                    ForEach(users) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            HStack {
                                Image(systemName: user.isClockedIn ? "person.circle.fill" : "person.crop.circle.badge.xmark")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .padding()
                                Spacer()
                                Text(user.name)
                                    .foregroundColor(.white)
                                    .font(.title2)
                                Spacer()
                                Text(user.isClockedIn ? "Clocked In" : "Clocked Out")
                                    .foregroundColor(user.isClockedIn ? .green : .red)
                                    .font(.title2)
                            }
                            .padding(.horizontal)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()

                Spacer()

                // Bottom Navigation Bar
                HStack {
                    Spacer()
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }

    // Methods for clock-in and clock-out actions
    private func clockIn() {
        isClockedIn = true
        updateUserClockInStatus(status: true)
    }

    private func clockOut() {
        isClockedIn = false
        updateUserClockInStatus(status: false)
    }
    
    private func updateUserClockInStatus(status: Bool) {
        let now = Date()
        for i in 0..<users.count {
            users[i].isClockedIn = status
            if status {
                users[i].lastClockIn = now
            }
        }
        saveUsers()
    }

    private func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: "users")
        }
    }

    private static func loadUsers() -> [User] {
        if let savedUsers = UserDefaults.standard.object(forKey: "users") as? Data {
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: savedUsers) {
                return decodedUsers
            }
        }
        // Return default users if no saved data is found
        return [
            User(name: "Kai", isClockedIn: false),
            User(name: "Peter", isClockedIn: false),
            User(name: "Victor", isClockedIn: false),
            User(name: "Frank", isClockedIn: false)
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
