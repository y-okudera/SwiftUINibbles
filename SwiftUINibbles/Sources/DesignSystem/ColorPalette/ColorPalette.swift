//
//  ColorPalette.swift
//  
//
//  Created by Yuki Okudera on 2021/10/20.
//

import SwiftUI

/// Base color palette materials
public struct BaseColor {

    // MARK: dynamic color sets

    let primaryGradientStart = Color("PrimaryGradientStart", bundle: .module)
    let primaryGradientEnd = Color("PrimaryGradientEnd", bundle: .module)

    // MARK: static color sets

    let lightGradientStart = Color("LightGradientStart", bundle: .module)
    let lightGradientEnd = Color("LightGradientEnd", bundle: .module)
    let darkGradientStart = Color("DarkGradientStart", bundle: .module)
    let darkGradientEnd = Color("DarkGradientEnd", bundle: .module)
}

/// Design tokens
public struct TokenColor {
    public let baseColor = BaseColor()

    public let gradientStartDefault: Color!
    public let gradientEndDefault: Color!

    public let lightGradientStart: Color!
    public let lightGradientEnd: Color!
    public let darkGradientStart: Color!
    public let darkGradientEnd: Color!

    init() {
        self.gradientStartDefault = baseColor.primaryGradientStart
        self.gradientEndDefault = baseColor.primaryGradientEnd

        self.lightGradientStart = baseColor.lightGradientStart
        self.lightGradientEnd = baseColor.lightGradientEnd
        self.darkGradientStart = baseColor.darkGradientStart
        self.darkGradientEnd = baseColor.darkGradientEnd
    }
}

extension Color {
    public static let token = TokenColor()
}
