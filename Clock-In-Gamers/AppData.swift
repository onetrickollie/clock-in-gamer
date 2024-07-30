//
//  AppData.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/28/24.
//

import Foundation
import SwiftUI

enum GamerType : String, Codable {
    case SUPER
    case RELIABLE
    case UNRELIABLE
    case NOTAGAMER
}

enum StatusType : String, Codable {
    case LATE
    case CLOCKEDIN
    case CLOCKEDOUT
}

struct alteredDate : Codable {
    var date : String
    var times : String?
    var isGaming : Bool
}

struct Schedules : Codable {
    var sunday: String
    var monday : String
    var tuesday : String
    var wednesday : String
    var thrusday : String
    var friday : String
    var saturday : String
    
    var alteredDates : [alteredDate]
}

protocol UserProto {
    var id : UUID { get set }
    var bio : String { get set }
    var discordLink : String { get set }
    var steamUserName : String { get set }
    var status: StatusType { get set }
    var points: Int64 { get set }
    var type: GamerType { get set }
    var clockedInAt : String { get set }
    var clockedOutAt : String { get set }
    var games : [String] { get set }
    var friends : [String] { get set }
    var schedule : Schedules? { get set }
}

class User : UserProto, ObservableObject, Codable {
    enum CodingKeys : CodingKey {
        case id, bio, discordLink, steamUserName, status, points, type, clockedInAt, clockedOutAt, games, friends, schedule
    }
    @Published var id: UUID
    @Published var bio: String
    @Published var discordLink: String
    @Published var steamUserName: String
    @Published var status: StatusType
    @Published var points: Int64
    @Published var type: GamerType
    @Published var clockedInAt: String
    @Published var clockedOutAt: String
    @Published var games: [String]
    @Published var friends: [String]
    @Published var schedule: Schedules?
    
    
    init() {
        id = UUID()
        bio = "Happy Gamer"
        discordLink = ""
        steamUserName = ""
        status = StatusType.CLOCKEDOUT
        points = 0
        type = GamerType.NOTAGAMER
        clockedInAt = ""
        clockedOutAt = ""
        games = []
        friends = []
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.bio = try container.decode(String.self, forKey: .bio)
        self.discordLink = try container.decode(String.self, forKey: .discordLink)
        self.steamUserName = try container.decode(String.self, forKey: .steamUserName)
        self.status = try container.decode(StatusType.self, forKey: .status)
        self.points = try container.decode(Int64.self, forKey: .points)
        self.type = try container.decode(GamerType.self, forKey: .type)
        self.clockedInAt = try container.decode(String.self, forKey: .clockedInAt)
        self.clockedOutAt = try container.decode(String.self, forKey: .clockedOutAt)
        self.games = try container.decode([String].self, forKey: .games)
        self.friends = try container.decode([String].self, forKey: .friends)
        self.schedule = try container.decodeIfPresent(Schedules.self, forKey: .schedule)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(bio, forKey: .bio)
        try container.encode(discordLink, forKey: .discordLink)
        try container.encode(steamUserName, forKey: .steamUserName)
        try container.encode(status, forKey: .status)
        try container.encode(points, forKey: .points)
        try container.encode(type, forKey: .type)
        try container.encode(clockedInAt, forKey: .clockedInAt)
        try container.encode(clockedOutAt, forKey: .clockedOutAt)
        try container.encode(games, forKey: .games)
        try container.encode(friends, forKey: .friends)
        try container.encodeIfPresent(schedule, forKey: .schedule)
    }
    func editBio(bio : String) -> Void {
        self.bio = bio
    }
    func editDiscordLink(discordLink : String) -> Void {
        self.discordLink = discordLink
    }
    func editSteamUserName(steamUserName : String) -> Void {
        self.steamUserName = steamUserName
    }
    func editStatus(status : StatusType) -> Void {
        self.status = status
    }
    func addPoints(add points: Int64) -> Void {
        self.points = points
    }
    func editType(type : GamerType) -> Void {
        self.type = type
    }
    func editClockedInAt(time : String) -> Void {
        self.clockedInAt = time
    }
    func editClockedOutAt(time : String) -> Void {
        self.clockedOutAt = time
    }
    func addGame(game: String) -> Void {
        self.games.append(game)
    }
    func deleteGame(index: Int) -> Void {
        self.games.remove(at: index)
    }
    func addFriend(friend : String) -> Void {
        self.friends.append(friend)
    }
    func deleteFriend(index : Int) -> Void {
        self.friends.remove(at: index)
    }
}

struct Data : Codable {
    var activeUser : User
    var allUsers : [User]
    var allGames : [String]
    var loggedInUsers : [User]
}

class AppData : ObservableObject {
    @Published var activeUser : User
    @Published var allUsers : [User]
    @Published var allGames : [String]
    @Published var loggedInUsers : [User]
    
    var fileURL : URL
    
    init(_ initUser : User) {
        activeUser = initUser
        loggedInUsers = []
        allUsers = []
        allGames = []
        let documentsDirectory =
           FileManager.default.urls(for: .documentDirectory,
           in: .userDomainMask).first!
        let archiveURL =
           documentsDirectory.appendingPathComponent("clockingamers")
           .appendingPathExtension("json")

        fileURL = archiveURL
        print(fileURL)
//        loadData()
    }
    func saveData() {
        
    }
    
//    func loadData() {
//        let jsonDecoder = JSONDecoder()
//        if let retrievedData = try? Data(contentsOf: fileURL),
//            let decodedData = try? jsonDecoder.decode([String].self, from: retrievedData) {
//            
//            
//        }
//    }
}


