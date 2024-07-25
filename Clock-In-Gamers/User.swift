//
//  User.swift
//  Clock-In-Gamers
//
//  Created by KaixiangLiu on 7/25/24.
//
import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let name: String
    var isClockedIn: Bool
    var lastClockIn: Date?

    init(name: String, isClockedIn: Bool) {
        self.id = UUID()
        self.name = name
        self.isClockedIn = isClockedIn
        self.lastClockIn = isClockedIn ? Date() : nil
    }

    init(id: UUID, name: String, isClockedIn: Bool, lastClockIn: Date?) {
        self.id = id
        self.name = name
        self.isClockedIn = isClockedIn
        self.lastClockIn = lastClockIn
    }
}
