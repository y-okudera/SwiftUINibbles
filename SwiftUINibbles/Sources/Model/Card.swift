//
//  Card.swift
//  
//
//  Created by Yuki Okudera on 2021/10/22.
//

import Foundation
import UIKit

public struct Card: Equatable, Identifiable {
    public var id: String
    public var icon: UIImage
    public var title: String
    public var minCount: Int
    public var maxCount: Int

    public init(
        id: String,
        icon: UIImage,
        title: String,
        minCount: Int,
        maxCount: Int
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self.minCount = minCount
        self.maxCount = maxCount
    }
}

// MARK: - Mock

extension Card {
    public static func mock() -> Card {
        Card(id: "0", icon: UIImage(systemName: "pencil")!, title: "Pencil", minCount: 2, maxCount: 16)
    }

    public static func firstLineCardsMock() -> [Card] {
        [
            Card(id: "0", icon: UIImage(systemName: "pencil")!, title: "Pencil", minCount: 2, maxCount: 16),
            Card(id: "1", icon: UIImage(systemName: "square.and.pencil")!, title: "Memo", minCount: 3, maxCount: 10),
            Card(id: "2", icon: UIImage(systemName: "scribble.variable")!, title: "Scribble", minCount: 6, maxCount: 12),
            Card(id: "3", icon: UIImage(systemName: "speaker.wave.3.fill")!, title: "Speaker", minCount: 2, maxCount: 5),
            Card(id: "4", icon: UIImage(systemName: "phone.fill")!, title: "Phone", minCount: 8, maxCount: 8),
        ]
    }

    public static func secondLineCardsMock() -> [Card] {
        [
            Card(id: "5", icon: UIImage(systemName: "envelope.fill")!, title: "Envelope", minCount: 5, maxCount: 5),
            Card(id: "6", icon: UIImage(systemName: "text.bubble.fill")!, title: "TextBubble", minCount: 6, maxCount: 10),
            Card(id: "7", icon: UIImage(systemName: "video.fill")!, title: "Video", minCount: 9, maxCount: 15),
            Card(id: "8", icon: UIImage(systemName: "mic.fill")!, title: "Mic", minCount: 1, maxCount: 8),
            Card(id: "9", icon: UIImage(systemName: "dot.radiowaves.left.and.right")!, title: "Radiowaves", minCount: 7, maxCount: 10),
        ]
    }
}
