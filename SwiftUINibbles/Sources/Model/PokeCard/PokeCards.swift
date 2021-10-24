//
//  PokeCards.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import Foundation

public struct PokeCards: Decodable, Equatable, Identifiable {
    public var id = UUID()
    public var cards: [PokeCard]
    
    public init(cards: [PokeCard]) {
        self.cards = cards
    }
    
    enum CodingKeys: String, CodingKey {
        case cards
    }
}

// MARK: - Mock

extension PokeCards {
    public static var mockPreview: Self {
        AssetLoader.loadWithDecode(name: "poke_cards")
    }
}
