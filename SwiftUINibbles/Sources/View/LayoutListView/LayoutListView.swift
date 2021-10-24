//
//  LayoutListView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/23.
//

import SwiftUI
import Model

public struct LayoutListView: View {
    public init() {

    }

    public var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(
                        destination: NeumorphicView()
                    ) {
                        Text("NeumorphicView")
                    }
                    NavigationLink(
                        destination: CardMenuView(firstLineCards: .firstLineCardsMock(), secondLineCards: .secondLineCardsMock())
                    ) {
                        Text("CardMenuView")
                    }
                    NavigationLink(
                        destination: PokeCardGridView(pokeCards: PokeCards.mockPreview.cards)
                    ) {
                        Text("PokeCardGridView")
                    }
                } header: {
                    Text("Basic")
                        .navigationTitle("SwiftUI")
                }
            }
        }
    }
}

struct LayoutListView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutListView()
    }
}
