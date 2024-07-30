//
//  Modifiers.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/26/24.
//

import Foundation
import SwiftUI

struct MainBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the VStack takes up the entire screen
            .background(Color.black) // Apply the background color to the VStack
            .foregroundColor(.white)
    }
}
