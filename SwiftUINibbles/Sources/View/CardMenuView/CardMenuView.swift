//
//  CardMenuView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/23.
//

import SwiftUI
import DesignSystem
import Model

struct CardMenuView: View {
    let firstLineCards: [Card]
    let secondLineCards: [Card]

    var body: some View {
        ZStack {
            Color.token.cardBackground
            ScrollView (.horizontal, showsIndicators: false) {
                VStack(spacing: 24) {
                    HStack {
                        ForEach(firstLineCards, id: \.id) { card in
                            Button(action: {
                                print("tapped card id: \(card.id) title: \(card.title)")
                            }) {
                                CardView(card: card)
                            }
                            .buttonStyle(CardButtonStyle())

                        }
                    }
                    HStack {
                        ForEach(secondLineCards, id: \.id) { card in
                            Button(action: {
                                print("tapped card id: \(card.id) title: \(card.title)")
                            }) {
                                CardView(card: card)
                            }
                            .buttonStyle(CardButtonStyle())
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("CardMenuView")
    }
}

struct CardMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CardMenuView(firstLineCards: .firstLineCardsMock(), secondLineCards: .secondLineCardsMock())
                .preferredColorScheme($0)
        }
    }
}
