//
//  LinearGradient+.swift
//  
//
//  Created by Yuki Okudera on 2021/10/21.
//

import SwiftUI

extension LinearGradient {
    public init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
