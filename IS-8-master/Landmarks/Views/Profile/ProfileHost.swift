//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if isEditing {
                ProfileEdit(profile: $draftProfile)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                                isEditing = false
                            }
                        }
                    }
            } else {
                ProfileSummary(profile: draftProfile)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Edit") {
                                isEditing = true
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
}
