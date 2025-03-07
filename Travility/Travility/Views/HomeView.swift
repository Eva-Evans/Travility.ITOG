//
//  HomeView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import SwiftUI
//import FirebaseFirestore

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
//    @FirestoreQuery private var holidays: [Holiday]
//    
//    init() {
//        self._holidays = FirestoreQuery(
//            collectionPath: "holidays"
//        )
////        Utils.db.collection("holidays").document(Utils.moscow.id).setData(Utils.moscow.asDictionary())
//    }

    var body: some View {
        VStack {
            Form {
                Section("Nice planned holidays") {
                    List(Utils.holidays) { holiday in
                        HolidayView(userId: "123", holiday: holiday)
                    }
                }
                
                Section("Select your destination") {
                    List {
                        continent(name: "South America")
                        continent(name: "North America")
                        continent(name: "Africa")
                        continent(name: "Europe")
                        continent(name: "Asia")
                        continent(name: "Australia")
                        continent(name: "Antarctica")
                    }
                }
            }
//            List(holidays, id: \.id) { holiday in
//                HolidayView(holiday: holiday)
//            }
        }
        .navigationTitle("Home")
    }
    
    @ViewBuilder
    private func continent(name: String) -> some View {
        NavigationLink(name) {
            List(Utils.holidays) { holiday in
                if holiday.continent == name {
                    HolidayView(userId: "123", holiday: holiday)
                }
            }
            .navigationTitle(name)
        }
    }
}

#Preview {
    HomeView()
}
