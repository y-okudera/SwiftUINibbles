//
//  PokeCardBannerView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/25.
//

import SwiftUI

public struct PokeCardBannerView: View {

    @State private var currentPage = 0

    public init() {

    }

    public var body: some View {
        GeometryReader { reader in
            AutoCarouselView(views: [
                bannerImage(name: "poke_card_banner1", width: reader.size.width),
                bannerImage(name: "poke_card_banner2", width: reader.size.width),
                bannerImage(name: "poke_card_banner3", width: reader.size.width),
                bannerImage(name: "poke_card_banner4", width: reader.size.width),
                bannerImage(name: "poke_card_banner5", width: reader.size.width),
            ])
        }
        .frame(width: UIScreen.main.bounds.width, height: 132, alignment: .center)
        .padding(.horizontal)
    }

    @ViewBuilder
    private func bannerImage(name: String, width: CGFloat) -> some View {
        Button(action: {
            print("selected banner name", name)
        }) {
            Image(uiImage: UIImage(named: name, in: Bundle.module, compatibleWith: nil))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
        }
    }
}

struct PokeCardBannerView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardBannerView()
    }
}
