//
//  ProfileView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.user {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                
                profileItem(key: "Username:", value: user.username)
                profileItem(key: "Email:", value: user.email)
                profileItem(
                    key: "Member since:",
                    value: "\(Utils.formatTimeInterval(timeInterval: user.joined))"
                )

                Button("Log Out") {
                    viewModel.logOut()
                }
                .tint(.pink)
                .padding()
                
                Button("Remove Profile") {
                    viewModel.removeProfile()
                }
                .tint(.red)
                .padding()
                
                Spacer()
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
        .navigationTitle("Profile")
    }
    
    @ViewBuilder
    private func profileItem(key: String, value: String) -> some View {
        HStack {
            Text(key)
                .bold()
            
            Text(value)
                .padding(.leading)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
