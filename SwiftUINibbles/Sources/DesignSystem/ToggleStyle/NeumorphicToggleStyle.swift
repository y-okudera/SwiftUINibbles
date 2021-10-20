//
//  NeumorphicToggleStyle.swift
//  
//
//  Created by Yuki Okudera on 2021/10/21.
//

import SwiftUI

public struct NeumorphicToggleStyle: ToggleStyle {
    public let gradientStartColor: Color
    public let gradientEndColor: Color

    public init(gradientStartColor: Color, gradientEndColor: Color) {
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            HighlightableBackground(
                gradientStartColor: gradientStartColor,
                gradientEndColor: gradientEndColor,
                isHighlighted: configuration.isOn,
                shape: Circle()
            )
        )
    }
}
