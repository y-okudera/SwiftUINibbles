//
//  Card.swift
//  
//
//  Created by Yuki Okudera on 2021/10/22.
//

import Foundation

public struct Card: Equatable, Identifiable {
    public var id: String
    public var systemImageName: String
    public var title: String
    public var minCount: Int
    public var maxCount: Int

    public init(
        id: String,
        systemImageName: String,
        title: String,
        minCount: Int,
        maxCount: Int
    ) {
        self.id = id
        self.systemImageName = systemImageName
        self.title = title
        self.minCount = minCount
        self.maxCount = maxCount
    }
}

// MARK: - Mock

extension Card {
    public static func mock() -> Card {
        Card(id: "0", systemImageName: "pencil", title: "Pencil", minCount: 2, maxCount: 16)
    }
}

extension Array where Element == Card {
    public static func firstLineCardsMock() -> [Card] {
        [
            Card(id: "0", systemImageName: "pencil", title: "Pencil", minCount: 2, maxCount: 16),
            Card(id: "1", systemImageName: "square.and.pencil", title: "Memo", minCount: 3, maxCount: 10),
            Card(id: "2", systemImageName: "scribble.variable", title: "Scribble", minCount: 6, maxCount: 12),
            Card(id: "3", systemImageName: "speaker.wave.3.fill", title: "Speaker", minCount: 2, maxCount: 5),
            Card(id: "4", systemImageName: "phone.fill", title: "Phone", minCount: 8, maxCount: 8),
        ]
    }

    public static func secondLineCardsMock() -> [Card] {
        [
            Card(id: "5", systemImageName: "envelope.fill", title: "Envelope", minCount: 5, maxCount: 5),
            Card(id: "6", systemImageName: "text.bubble.fill", title: "TextBubble", minCount: 6, maxCount: 10),
            Card(id: "7", systemImageName: "video.fill", title: "Video", minCount: 9, maxCount: 15),
            Card(id: "8", systemImageName: "mic.fill", title: "Mic", minCount: 1, maxCount: 8),
            Card(id: "9", systemImageName: "dot.radiowaves.left.and.right", title: "Radiowaves", minCount: 7, maxCount: 10),
        ]
    }
}
