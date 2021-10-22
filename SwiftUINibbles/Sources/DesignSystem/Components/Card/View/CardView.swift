//
//  CardView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/22.
//

import SwiftUI
import Model

public struct CardView: View {
    @Environment(\.colorScheme) var colorScheme

    public let card: Card

    public init(card: Card) {
        self.card = card
    }

    public var body: some View {
        let w = UIScreen.main.bounds.width * 0.4
        let h = w * 1.4

        ZStack {
            Color.token.cardBackground
            VStack(spacing: 32) {
                Image(uiImage: card.icon)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Text(card.title)
                Text("\(card.minCount) / \(card.maxCount)")
            }
        }
        .cornerRadius(8)
        .shadow(
            color: colorScheme == .light ? .token.blackShadow : .token.whiteShadow,
            radius: 4
        )
        .frame(width: w, height: h)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CardView(card: .mock()).preferredColorScheme($0)
        }
    }
}
