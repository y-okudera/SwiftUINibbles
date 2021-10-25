//
//  PokeCardGridView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import SwiftUI
import DesignSystem
import Model

public struct PokeCardGridView: View {
    public let pokeCards: [PokeCard]
    @State private var style: GridLayoutStyle = .listLike

    public init(pokeCards: [PokeCard]) {
        self.pokeCards = pokeCards
    }

    private var items: [GridItem] {
        switch style {
        case .normalGrid:
            return Array(repeating: .init(.flexible()), count: 3)
        case .listLike:
            return Array(repeating: .init(.flexible()), count: 1)
        }
    }

    public var body: some View {
        ScrollView(.vertical) {

            // Header
            PokeCardBannerView()

            LazyVGrid(columns: items, spacing: 10, pinnedViews: [.sectionHeaders]) {
                Section(header: stickyHeader) {
                    ForEach(pokeCards, id: \.id) { pokeCard in
                        switch style {
                        case .normalGrid:
                            PokeCardGridItemView(pokeCard: pokeCard)
                        case .listLike:
                            PokeCardListItemView(pokeCard: pokeCard)
                        }

                    }
                }
                .animation(nil)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width)
        }
        .animation(.default)
        .navigationTitle("PokeCardGridView")
        .navigationBarItems(
            trailing: Button(
                action: {
                    style.toggle()
                }, label: {
                    Image(systemName: style.systemImageName)
                }
            )
        )
    }

    private var stickyHeader: some View {
        ZStack {
            Color.token.cardBackground
                .frame(width: UIScreen.main.bounds.width, height: 44)
            Text("Pokemon Cards")
                .font(.headline)
        }
    }
}

struct PokeCardGridView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            PokeCardGridView(pokeCards: PokeCards.mockPreview.cards)
                .preferredColorScheme($0)
        }
    }
}
