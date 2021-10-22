//
//  NeumorphicButtonStyle.swift
//  
//
//  Created by Yuki Okudera on 2021/10/21.
//

import SwiftUI

public struct NeumorphicButtonStyle: ButtonStyle {
    public let gradientStartColor: Color
    public let gradientEndColor: Color

    public init(gradientStartColor: Color, gradientEndColor: Color) {
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                HighlightableBackground(
                    gradientStartColor: gradientStartColor,
                    gradientEndColor: gradientEndColor,
                    isHighlighted: configuration.isPressed,
                    shape: Circle()
                )
            )
            .animation(nil)
    }
}
