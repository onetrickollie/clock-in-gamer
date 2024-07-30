import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(viewModel.profile.username)
                            .font(.largeTitle)
                    }
                    .padding()

                    Text("Bio")
                        .font(.headline)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if isEditing {
                        TextField("Enter your bio", text: $viewModel.profile.bio)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)
                    } else {
                        Text(viewModel.profile.bio)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding()
                    }

                    Text("Discord link")
                        .font(.headline)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if isEditing {
                        TextField("Enter your Discord link", text: $viewModel.profile.discordLink)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)
                    } else {
                        Link("Discord link", destination: URL(string: viewModel.profile.discordLink)!)
                            .padding(.top)
                    }

                    Text("Steam username")
                        .font(.headline)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if isEditing {
                        TextField("Enter your Steam username", text: $viewModel.profile.steamUsername)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)
                    } else {
                        Text(viewModel.profile.steamUsername)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Button(isEditing ? "Save" : "Edit") {
                        isEditing.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Spacer()

                    // Calendar view
                    CalendarView()
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Profile", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Add log out functionality here
                    }) {
                        Text("Log Out")
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.red)
                            .clipShape(Capsule())
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Fix the white bar at the top
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
