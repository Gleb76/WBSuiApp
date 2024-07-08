//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    Text(profile.username)
                        .bold()
                        .font(.title)
                    Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                    Divider()
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileSummary(profile: .default)
}

