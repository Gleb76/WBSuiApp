//
//  ProfileEdit.swift
//  Landmarks
//
//  Created by Глеб Клыга on 6.07.24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

//Задача: на основе проекта на уроке реализовать функцию редактирования профиля:
//1. Создать в правом верхнем углу кнопку "edit"
//2. По нажатию на нее дать возможность пользователю отредактировать профиль(username, notifications on/off, seasonal photos, date)
//3.Добавить кнопку Save для выхода из режима редактирования и сохранения введенных данных


struct ProfileEdit: View {
    @Binding var profile: Profile
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Edit your profile name:", text: $profile.username)
                Toggle("Notifications", isOn: $profile.prefersNotifications)
                Picker("Seasonal photo:", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                DatePicker("Goal Date", selection: $profile.goalDate, displayedComponents: .date)
            }
            .navigationTitle("Edit Profile")
        }
    }
}

#Preview {
    ProfileEdit(profile: .constant(.default))
}
