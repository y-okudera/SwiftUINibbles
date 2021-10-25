//
//  GridLayoutStyle.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import Foundation

public enum GridLayoutStyle {
    case normalGrid
    case listLike

    public mutating func toggle() {
        switch self {
        case .listLike:
            self = .normalGrid
        case .normalGrid:
            self = .listLike
        }
    }

    public var systemImageName: String {
        switch self {
        case .listLike:
            return "square.grid.2x2"
        case .normalGrid:
            return "list.bullet"
        }
    }
}
