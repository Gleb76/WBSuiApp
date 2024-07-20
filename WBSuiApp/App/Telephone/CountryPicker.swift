//
//  CountryPicker.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 19.07.24.
//

import SwiftUI

struct CountryPicker: View {
    @Binding var selectedCountryIndex: Int
    @State private var showPicker: Bool = false

    var body: some View {
        VStack {
            HStack {
                Image(countries[selectedCountryIndex])
                    .resizable()
                    .frame(width: 20, height: 15)
                    .clipShape(Rectangle())

                Text("\(countryCodes[selectedCountryIndex])")
                    .foregroundColor(.black)

                Spacer()

                Button(action: {
                    withAnimation {
                        showPicker.toggle()
                    }
                }) {
                    Image(systemName: showPicker ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            .frame(height: 44)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .onTapGesture {
                withAnimation {
                    showPicker.toggle()
                }
            }

            if showPicker {
                VStack {
                    ForEach(0..<countries.count, id: \.self) { index in
                        HStack {
                            Image(countries[index])
                                .resizable()
                                .frame(width: 20, height: 15)
                                .clipShape(Rectangle())

                            Text("\(countryCodes[index])")
                                .foregroundColor(.black)

                            Spacer()
                        }
                        .padding()
                        .background(index == selectedCountryIndex ? Color.gray.opacity(0.2) : Color.clear)
                        .onTapGesture {
                            selectedCountryIndex = index
                            withAnimation {
                                showPicker.toggle()
                            }
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
        }
        .frame(height: showPicker ? nil : 44)  
    }
}
