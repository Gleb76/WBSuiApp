//
//  AnimeListView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.08.24.
//

import SwiftUI
import AnimeAPI

struct AnimeListView: View {
    @StateObject private var viewModel = AnimeListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    List(viewModel.animeTitles, id: \.id) { title in
                        NavigationLink(destination: AnimeDetailView(title: title)) {
                            AnimeRow(title: title)
                        }
                    }
                }
            }
            .navigationTitle("Anime List")
            .toolbar {
                Button(action: {
                    viewModel.fetchAnimeTitles()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}

struct AnimeRow: View {
    let title: Title

    var body: some View {
        HStack {
            if let thumbnailURL = URL(string: title.posters.medium.url) {
                AsyncImage(url: thumbnailURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 75)
                .cornerRadius(5)
            }
            VStack(alignment: .leading) {
                Text(title.names.ru)
                    .font(.headline)
                Text(title.names.en)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if let alternativeName = title.names.alternative {
                    Text(alternativeName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct AnimeDetailView: View {
    let title: Title

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let originalURL = URL(string: title.posters.original.url) {
                AsyncImage(url: originalURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(10)
            }
            Text(title.names.ru)
                .font(.largeTitle)
            Text(title.description)
                .font(.body)
        }
        .padding()
        .navigationTitle(title.names.en)
    }
}

#Preview {
    AnimeListView()
}
