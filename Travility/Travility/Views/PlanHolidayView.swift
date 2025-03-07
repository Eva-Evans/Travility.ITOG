//
//  PlanHolidayView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 28.02.2025.
//

import SwiftUI
import PhotosUI

struct PlanHolidayView: View {
    @StateObject private var viewModel = PlanHolidayViewModel()
    
    let holiday: Holiday

    @Binding var planHolidayPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                RatingView(rating: $viewModel.holiday.rating)
                
                Form {
                    places()
                    images()
                }
                
                Spacer()
                
                TravilityButton(title: "Plan", background: .pink) {
                    viewModel.plan()
                    planHolidayPresented = false
                }
                .padding()
                .frame(maxHeight: 80)

            }
            .onAppear {
                viewModel.holiday = holiday
            }
            .navigationTitle("Plan Holiday to \(holiday.country)")
        }
    }
    
    @ViewBuilder private func places() -> some View {
        Section("Places") {
            Button {
                viewModel.addPlace()
            } label: {
                Label("Add Place", systemImage: "plus")
            }
            
            ForEach(viewModel.holiday.places) { place in
                let placeNumber = viewModel.holiday.places.firstIndex(of: place)!
                
                PlaceView(place: $viewModel.holiday.places[placeNumber]) {
                    viewModel.removePlace(placeNumber: placeNumber)
                }
            }
        }
    }
    
    @ViewBuilder
    private func images() -> some View {
        Section("Images") {
            PhotosPicker(selection: $viewModel.imagePickers, matching: .images) {
                Label("Add Images", systemImage: "plus")
            }
            .onChange(of: viewModel.imagePickers) {
                Task {
                    viewModel.holiday.images.removeAll()
                    
                    for item in viewModel.imagePickers {
                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
                            if let imageText = loadedImage.base64 {
                                viewModel.holiday.images.append(imageText)
                            }
                        }
                    }
                }
            }
            
            if !viewModel.holiday.images.isEmpty {
                ImagesView(imagesStrings: viewModel.holiday.images, height: 200)
            }
        }
    }
}

#Preview {
    PlanHolidayView(holiday: Utils.russia, planHolidayPresented: Binding(
        get: { return true },
        set: { _ in }
    ))
}
