//
//  User.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import Foundation

struct User : Codable, Identifiable, Hashable {
    let id: String
    var username: String
    var email: String
    var joined: TimeInterval
}
