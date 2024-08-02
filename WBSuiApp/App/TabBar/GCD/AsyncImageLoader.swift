//
//  AsyncImageLoader.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 2.08.24.
//

import SwiftUI

class AsyncImageLoader: ObservableObject {
    @Published var image: Image?

       func loadImage(from name: String) {
           DispatchQueue.global().async {
               let image = Image(name)
               DispatchQueue.main.async {
                   self.image = image
               }
           }
       }
}

