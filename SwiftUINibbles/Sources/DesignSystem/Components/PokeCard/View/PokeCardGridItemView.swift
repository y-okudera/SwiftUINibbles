//
//  PokeCardGridItemView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import SwiftUI
import Model
import Kingfisher
import SkeletonUI

public struct PokeCardGridItemView: View {
    public let pokeCard: PokeCard
    public init(pokeCard: PokeCard) {
        self.pokeCard = pokeCard
    }

    public var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 4) {
                KFImage(pokeCard.imageURL)
                    .placeholder {
                        Rectangle()
                            .skeleton(with: true)
                            .shape(type: .rectangle)
                            .animation(type: .pulse())
                    }
                    .resizable()
                    .aspectRatio(CGSize(width: 24, height: 33), contentMode: .fit)
                    .clipped()
                VStack(alignment: .leading, spacing: 0) {
                    Text(pokeCard.name)
                        .font(.system(size: 18, weight: .bold))
                        .lineLimit(1)
                }
            }
        }
    }
}

// MARK: - Previews

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            PokeCardGridItemView(pokeCard: PokeCards.mockPreview.cards.first!)
                .preferredColorScheme($0)
        }
    }
}
