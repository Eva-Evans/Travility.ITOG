//
//  PlacesView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import SwiftUI

struct PlacesView: View {
    @StateObject private var viewModel = PlacesViewModel()

    var body: some View {
        Form {
            ForEach(Array(viewModel.holidaysByContinents.keys).sorted(), id: \.self) { continent in
                Section(continent) {
                    ForEach(viewModel.holidaysByContinents[continent]!, id: \.self) { holiday in
                        ImagesView(imagesStrings: holiday.images, height: 200)
                    }
                }
            }
        }
        .navigationTitle("Places")
    }
}

#Preview {
    PlacesView()
}
