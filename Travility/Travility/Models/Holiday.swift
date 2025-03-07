//
//  Holiday.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import Foundation

struct Holiday: Codable, Identifiable, Hashable {
    var id: String
    let country: String
    let continent: String
    var places: [Place]
    var images: [String]
    var rating: Int
}

struct Place : Codable, Identifiable, Hashable {
    let id: String
    var city: String
    var hotel: String
    var arrival: TimeInterval
    var departure: TimeInterval
    var sights: [String]
    var price: Int
    var currency: String
}
