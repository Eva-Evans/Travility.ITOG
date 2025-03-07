//
//  PlacesViewModel.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import Foundation

class PlacesViewModel : ObservableObject {
    var holidaysByContinents: [String : [Holiday]] {
        var result: [String : [Holiday]] = [:]
        
        Utils.holidays.forEach { holiday in
            if result.keys.contains(holiday.continent) {
                result[holiday.continent]!.append(holiday)
            } else {
                result[holiday.continent] = [holiday]
            }
        }
        
        return result
    }
}
