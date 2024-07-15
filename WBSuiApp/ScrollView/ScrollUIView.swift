//
//  ScrollUIView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 10.07.24.
//

import SwiftUI

//Rotation3dEffect попробовать

struct ScrollUIView: View {
    @State private var items = Array(1...50)
    @State private var positions = Array(1...50).shuffled()
    
    let config = [
        GridItem(.flexible(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: config, alignment: .center, spacing: 20) {
                    ForEach(items.indices, id: \.self) { index in
                        let isEvenIndex = positions[index] % 2 == 0
                        
                        ZStack {
                            EmojiView()
                            
                            AlternatingLayoutView(isEvenIndex: isEvenIndex)
                                .onAppear {
                                    if index == items.count - 1 {
                                        loadMore()
                                    }
                                }
                        }
                    }
                }
                .padding()
            }
            .frame(maxHeight: .infinity)
        }
        .onAppear {
            startAutoUpdate()
        }
    }
    
    private func loadMore() {
        let newItems = (items.count + 1)...(items.count + 50)
        items.append(contentsOf: newItems)
        positions.append(contentsOf: newItems.shuffled())
    }
    
    private func startAutoUpdate() {
        _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            shufflePositions()
        }
    }
    
    private func shufflePositions() {
        withAnimation {
            positions.shuffle()
        }
    }
}

struct AlternatingLayoutView: View {
    let isEvenIndex: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            if isEvenIndex {
                VStack(spacing: 20) {
                    RectangleView()
                        .frame(width: 100, height: 70)
                    
                    RectangleView()
                        .frame(width: 100, height: 70)
                }
                
                RectangleView()
                    .frame(width: 100, height: 160)
            } else {
                RectangleView()
                    .frame(width: 100, height: 160)
                
                VStack(spacing: 20) {
                    RectangleView()
                        .frame(width: 100, height: 70)
                    
                    RectangleView()
                        .frame(width: 100, height: 70)
                }
            }
        }
    }
}

struct EmojiView: View {
    @State private var rotationAngle: Angle = .degrees(0)

    var body: some View {
        Text(randomEmoji())
            .font(.largeTitle)
            .opacity(0.5)
            .padding()
            .rotationEffect(rotationAngle)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                    rotationAngle = .degrees(360)
                }
            }
    }

    private func randomEmoji() -> String {
        let emojiRange = 0x1F300...0x1F3F0
        return String(UnicodeScalar(emojiRange.randomElement()!)!)
    }
}
struct RectangleView: View {
    @State private var rotationAngle: Angle = .degrees(0)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                .rotationEffect(rotationAngle)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever()) {
                        rotationAngle = .degrees(360)
                    }
                }
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.clear)
        )
    }
}


#Preview {
    ScrollUIView()
}
