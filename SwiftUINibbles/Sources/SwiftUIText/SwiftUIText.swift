//
//  SwiftUIText.swift
//  
//
//  Created by Yuki Okudera on 2021/10/18.
//

import SwiftUI

public struct SwiftUIText: View {
    public init() { }
    public var body: some View {
        Text("Hello, ")
            .foregroundColor(.black)
            .font(.title)
        + Text("SwiftUI")
            .foregroundColor(.orange)
            .font(.system(size: 27))
        + Text("!")
            .foregroundColor(.red)
            .font(.system(size: 27).bold())
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
