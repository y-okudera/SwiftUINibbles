//
//  CardButtonStyle.swift
//  
//
//  Created by Yuki Okudera on 2021/10/22.
//

import SwiftUI

public struct CardButtonStyle: ButtonStyle {
    public init() {

    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(4)
            .background(configuration.isPressed ? Color.token.cardHighlight : Color.clear)
            .cornerRadius(8)
    }
}
