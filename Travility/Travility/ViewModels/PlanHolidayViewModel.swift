//
//  PlanHolidayViewModel.swift
//  Travility
//
//  Created by Сергей Зауэрс on 28.02.2025.
//

import Foundation
import SwiftUI
import PhotosUI
import FirebaseAuth

class PlanHolidayViewModel : ObservableObject {
    @Published var holiday = Utils.russia
    @Published var imagePickers = [PhotosPickerItem]()

    func plan() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        holiday.id = UUID().uuidString
        
        Utils.db.collection("users").document(userId).collection("plans").document(holiday.id).setData(holiday.asDictionary())
    }
    
    func addPlace() {
        holiday.places.append(Place(
            id: UUID().uuidString,
            city: "",
            hotel: "",
            arrival: 0,
            departure: 1,
            sights: [],
            price: 0,
            currency: "rub"
        ))
    }
    
    func removePlace(placeNumber: Int) {
        holiday.places.remove(at: placeNumber)
    }
}
