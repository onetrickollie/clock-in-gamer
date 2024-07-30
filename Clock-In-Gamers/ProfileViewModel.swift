import Foundation

struct Profile {
    var username: String
    var bio: String
    var discordLink: String
    var steamUsername: String
}

class ProfileViewModel: ObservableObject {
    // The profile data that will be used to display and edit the profile
    @Published var profile = Profile(
        username: "User 1",
        bio: "Have you ever heard the tragedy of Darth Plagueis the wise? No, it’s not a story the Jedi would teach you.",
        discordLink: "https://discord.com/user",
        steamUsername: "user"
    )
}
