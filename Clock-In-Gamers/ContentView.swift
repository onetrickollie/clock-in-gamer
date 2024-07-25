import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
    var isClockedIn: Bool
}

struct ContentView: View {
    // Usernames array
    @State private var users = [
        User(name: "Kai", isClockedIn: false),
        User(name: "Peter", isClockedIn: false),
        User(name: "Victor", isClockedIn: false),
        User(name: "Frank", isClockedIn: false)
    ]

    @State private var isClockedIn = false

    var body: some View {
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
                            .foregroundColor(isClockedIn ? .green : .red)
                            .font(.title2)
                    }
                    .padding(.horizontal)
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
        for i in 0..<users.count {
            users[i].isClockedIn = status
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
