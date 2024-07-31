import SwiftUI

struct ProfileView: View {
    @State private var isEditing = false
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image("kirby")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(appData.activeUser.name)
                            .font(.largeTitle)
                    }
                    .padding()

                    if isEditing {
                        Text("User Name")
                            .font(.headline)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter your new name", text: $appData.activeUser.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)

                        Text("Bio")
                            .font(.headline)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter your bio", text: $appData.activeUser.bio)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)

                        Text("Discord link")
                            .font(.headline)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter your Discord link", text: $appData.activeUser.discordLink)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)

                        Text("Steam username")
                            .font(.headline)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter your Steam username", text: $appData.activeUser.steamUserName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)

                        Text("Xbox username")
                            .font(.headline)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter your Xbox username", text: $appData.activeUser.xboxUserName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .frame(maxWidth: .infinity)
                    } else {
                        Text(appData.activeUser.bio.isEmpty ? "Hello!" : appData.activeUser.bio)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding()

                        if !appData.activeUser.discordLink.isEmpty {
                            Text("Discord link")
                                .font(.headline)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            if let urlExists = try? URL(string: appData.activeUser.discordLink) {
                                Link("Discord link", destination: urlExists)
                                    .padding(.top)
                            } else {
                                Text("No link")
                                    .padding(.top)
                            }
                        }

                        if !appData.activeUser.steamUserName.isEmpty {
                            Text("Steam username")
                                .font(.headline)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(appData.activeUser.steamUserName)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if !appData.activeUser.xboxUserName.isEmpty {
                            Text("Xbox username")
                                .font(.headline)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(appData.activeUser.xboxUserName)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }

                    if isEditing {
                        Button("Save") {
                            if appData.activeUser.bio.isEmpty {
                                appData.activeUser.bio = "Hello!"
                            }
                            appData.saveData()
                            isEditing.toggle()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    } else {
                        Button("Edit") {
                            isEditing.toggle()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    Spacer()
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
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
