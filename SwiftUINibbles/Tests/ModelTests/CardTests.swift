//
//  CardTests.swift
//  
//
//  Created by Yuki Okudera on 2021/10/23.
//

import XCTest
@testable import Model

final class CardTests: XCTestCase {
    func testInit() throws {
        let card = Card(id: "0", icon: UIImage(systemName: "pencil")!, title: "Pencil", minCount: 2, maxCount: 10)
        XCTAssertEqual(card.id, "0")
        XCTAssertEqual(card.icon, UIImage(systemName: "pencil"))
        XCTAssertEqual(card.title, "Pencil")
        XCTAssertEqual(card.minCount, 2)
        XCTAssertEqual(card.maxCount, 10)
    }
}
