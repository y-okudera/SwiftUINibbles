//
//  HighlightableBackground.swift
//  
//
//  Created by Yuki Okudera on 2021/10/21.
//

import SwiftUI

public struct HighlightableBackground<S: Shape>: View {
    public let gradientStartColor: Color
    public let gradientEndColor: Color
    public var isHighlighted: Bool
    public var shape: S

    public init(gradientStartColor: Color, gradientEndColor: Color, isHighlighted: Bool, shape: S) {
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
        self.isHighlighted = isHighlighted
        self.shape = shape
    }

    public var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(gradientEndColor, gradientStartColor))
                    .overlay(shape.stroke(LinearGradient(gradientStartColor, gradientEndColor), lineWidth: 4))
                    .shadow(color: gradientStartColor, radius: 10, x: 5, y: 5)
                    .shadow(color: gradientEndColor, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(gradientStartColor, gradientEndColor))
                    .overlay(shape.stroke(gradientEndColor, lineWidth: 4))
                    .shadow(color: gradientStartColor, radius: 10, x: -10, y: -10)
                    .shadow(color: gradientEndColor, radius: 10, x: 10, y: 10)
            }
        }
    }
}
