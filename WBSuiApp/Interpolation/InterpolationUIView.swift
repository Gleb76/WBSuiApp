//
//  InterpolationUIView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 4.07.24.
//

import SwiftUI

import SwiftUI

struct InterpolationUIView: View {
    
    @ObservedObject private var viewModel = DataPickerViewModel()
    
    var body: some View {
        VStack {
            DatePicker("Selected Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
            
            Picker("Select Language", selection: $viewModel.selectedLocale) {
                ForEach(viewModel.locales, id: \.self) { locale in
                    Text(viewModel.flags[viewModel.locales.firstIndex(of: locale)!]).tag(locale)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Toggle("Spell Out", isOn: $viewModel.spellOut)
                .padding()
            
            ForEach(viewModel.getDates(), id: \.self) { date in
                Text(viewModel.formattedDateString(from: date))
                    .font(viewModel.selectedDate == date ? .headline : .body)
                    .foregroundColor(viewModel.selectedDate == date ? .blue : .primary)
                    .padding()
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)  
            }
        }
        .padding()
    }
}

#Preview {
    InterpolationUIView()
}
