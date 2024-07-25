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
                // Clock In and Clock Out Buttons
                HStack {
                    VStack {
                        Button(action: clockIn) {
                            Image(systemName: "gamecontroller.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(isClockedIn ? .gray : .green)
                            Text("clock in")
                                .foregroundColor(.white)
                        }
                    }
                    .disabled(isClockedIn)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: clockOut) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(isClockedIn ? .red : .gray)
                            Text("clock out")
                                .foregroundColor(.white)
                        }
                    }
                    .disabled(!isClockedIn)
                }
                .padding()
                .background(Color.gray)

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
                .background(Color.gray)
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
