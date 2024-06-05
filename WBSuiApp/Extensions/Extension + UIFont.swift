//
//  Extension + UIFont.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 5.06.24.
//

import SwiftUI

extension Font {
    static func sfProDisplay(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName: String
        switch weight {
        case .ultraLight: fontName = "SFProDisplay-Ultralight"
        case .thin: fontName = "SFProDisplay-Thin"
        case .light: fontName = "SFProDisplay-Light"
        case .regular: fontName = "SFProDisplay-Regular"
        case .medium: fontName = "SFProDisplay-Medium"
        case .semibold: fontName = "SFProDisplay-Semibold"
        case .bold: fontName = "SFProDisplay-Bold"
        case .heavy: fontName = "SFProDisplay-Heavy"
        case .black: fontName = "SFProDisplay-Black"
        default: fontName = "SFProDisplay-Regular"
        }
        return .custom(fontName, size: size)
    }
}
