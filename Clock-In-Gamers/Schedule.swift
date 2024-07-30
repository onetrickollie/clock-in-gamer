//
//  Schedule.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/26/24.
//

import SwiftUI

struct Schedule: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("You are in Schdule")
            }
            .modifier(MainBackground())
        }
    }
}

#Preview {
    Schedule()
}
