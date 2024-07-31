//
//  Home.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/26/24.
//

import SwiftUI

struct Home: View {
    // Methods for clock-in and clock-out actions
    @State var isClockedIn: Bool = false
    @EnvironmentObject var appData : AppData
  
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
        for i in 0..<appData.allUsers.count {
            appData.allUsers[i].isClockedIn = status
            if status {
                appData.allUsers[i].clockedInAt = now
            }
        }
//        saveUsers()
    }

//    private func saveUsers() {
//        if let encoded = try? JSONEncoder().encode(users) {
//            UserDefaults.standard.set(encoded, forKey: "users")
//        }
//    }
//
//    private static func loadUsers() -> [User] {
//        if let savedUsers = UserDefaults.standard.object(forKey: "users") as? Data {
//            if let decodedUsers = try? JSONDecoder().decode([User].self, from: savedUsers) {
//                return decodedUsers
//            }
//        }
//        // Return default users if no saved data is found
//        return [
//            User(name: "Kai", isClockedIn: false),
//            User(name: "Peter", isClockedIn: false),
//            User(name: "Victor", isClockedIn: false),
//            User(name: "Frank", isClockedIn: false)
//        ]
//    }
    var body: some View {
        GeometryReader { geometry in
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
                    TopWidgetView(isClockedIn: $isClockedIn, clockIn: clockIn, clockOut: clockOut)
                    
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

                    // Scrollable User List
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(appData.allUsers) { user in
                                NavigationLink(destination: UserDetailView(user: user)) {
                                    UserRowView(user: user)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding()
                    }

                    Spacer()

                    // Bottom Navigation Bar
//                    HStack {
//                        Spacer()
//                        Image(systemName: "house.fill")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.white)
//                        Spacer()
//                        Image(systemName: "person.fill")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.white)
//                        Spacer()
//                        Image(systemName: "calendar")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.white)
//                        Spacer()
//                    }
//                    .padding()
//                    .background(Color.gray.opacity(0.5))
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
                }
                .background(Color.black.edgesIgnoringSafeArea(.all))
            }
            .modifier(MainBackground())
        }
    }
}

#Preview {
    Home()
}



