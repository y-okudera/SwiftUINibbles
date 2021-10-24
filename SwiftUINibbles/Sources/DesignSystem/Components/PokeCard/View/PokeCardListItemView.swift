//
//  PokeCardListItemView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import SwiftUI
import Model
import Kingfisher
import SkeletonUI

public struct PokeCardListItemView: View {
    public let pokeCard: PokeCard
    public init(pokeCard: PokeCard) {
        self.pokeCard = pokeCard
    }

    public var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(spacing: 8) {
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
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 8) {
                    Text(pokeCard.name)
                        .font(.system(size: 18, weight: .bold))
                        .lineLimit(1)
                    Text("No. \(pokeCard.nationalPokedexNumber ?? 0)")
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .if(pokeCard.nationalPokedexNumber == nil) { $0.hidden() }
                    Text("HP: \(pokeCard.hpIntValue ?? 0)")
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .if(pokeCard.hpIntValue == nil) { $0.hidden() }
                    Text("TCG Types: \(pokeCard.types?.joined(separator: "/") ?? "-")")
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .if(pokeCard.types == nil) { $0.hidden() }
                }
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

// MARK: - Previews

struct PokeCardListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            PokeCardListItemView(pokeCard: PokeCards.mockPreview.cards.first!)
                .preferredColorScheme($0)
        }
    }
}
