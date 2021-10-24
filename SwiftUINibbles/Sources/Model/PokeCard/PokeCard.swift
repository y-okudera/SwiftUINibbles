//
//  PokeCard.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import Foundation

public struct PokeCard: Decodable, Equatable, Identifiable {
    public var id: String
    public var name: String
    public var nationalPokedexNumber: Int?
    var hp: String?
    public var types: [String]?
    var imageURLString: String

    public var hpIntValue: Int? {
        return Int(self.hp ?? "")
    }

    public var imageURL: URL? {
        return URL(string: imageURLString)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nationalPokedexNumber
        case hp
        case imageURLString = "imageUrl"
        case types
    }

    init(
        id: String,
        name: String,
        nationalPokedexNumber: Int? = nil,
        hp: String? = nil,
        types: [String]? = nil,
        imageURLString: String
    ) {
        self.id = id
        self.name = name
        self.nationalPokedexNumber = nationalPokedexNumber
        self.hp = hp
        self.types = types
        self.imageURLString = imageURLString
    }
}
