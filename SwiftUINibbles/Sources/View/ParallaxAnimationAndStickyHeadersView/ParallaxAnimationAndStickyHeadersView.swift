//
//  ParallaxAnimationAndStickyHeadersView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/28.
//

import SwiftUI
import DesignSystem

#warning("後で切り出す")
import Kingfisher

public struct ParallaxAnimationAndStickyHeadersView: View {

    @Environment(\.colorScheme) var colorScheme
    @Namespace var animation
    @State private var offset: CGFloat = 0
    @State private var currentTab = "Tweets"
    @State private var tabBarOffset: CGFloat = 0
    @State private var titleOffset: CGFloat = 0

    public init() {

    }

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {

                // Header View...
                GeometryReader { reader -> AnyView in

                    // Sticky Header...
                    let minY = reader.frame(in: .global).minY
                    DispatchQueue.main.async {
                        self.offset = minY
                    }

                    return AnyView(
                        ZStack {
                            KFImage(URL(string: "https://placehold.jp/24/cc9999/993333/375x132.png"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width,
                                       height: minY > 0 ? 180 + minY : 180,
                                       alignment: .center)
                                .cornerRadius(0)

                            BlurView()
                                .opacity(blurViewOpacity())

                            // Title View..
                            VStack(spacing: 5) {
                                Text("Pokemon")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                Text("200 Tweets")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            // to slide from bottom added extra 60..
                            .offset(y: 120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleTextOffset())
                            .opacity(titleOffset < 100 ? 1 : 0)
                        }
                        .clipped()
                        // stretchy
                        .frame(height: minY > 0 ? 180 + minY : nil)
                        .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)


                    )
                }
                .frame(height: 180)
                .zIndex(1)

                // Profile Image...
                VStack {
                    HStack {
                        KFImage(URL(string: "https://placehold.jp/24/cc9999/993333/150x150.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding(8)
                            .background(colorScheme == .dark ? Color.black: Color.white)
                            .clipShape(Circle())
                            .offset(y: offset < 0 ? getOffset() - 20 : -20)
                            .scaleEffect(getScale())


                        Spacer()

                        Button(action: {}) {
                            Text("Edit Profile")
                                .foregroundColor(.blue)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(
                                    Capsule()
                                        .stroke(Color.blue, lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(.top, -25)
                    .padding(.bottom, -10)

                    // Profile Data ...

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Pokemon")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text("@_Pokemon")
                            .foregroundColor(.gray)

                        Text("Profile message Profile message Profile message Profile message Profile message.")

                        HStack(spacing: 5) {
                            Text("123")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)

                            Text("Followers")
                                .foregroundColor(.gray)

                            Text("987")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                                .padding(.leading, 10)

                            Text("Following")
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 8)
                    }
                    .overlay(
                        GeometryReader { reader -> Color in
                            let minY = reader.frame(in: .global).minY
                            DispatchQueue.main.async {
                                self.titleOffset = minY
                            }
                            return Color.clear
                        }
                            .frame(width: 0, height: 0)
                        , alignment: .top
                    )

                    // Custom Segmented Menu...
                    VStack(spacing: 0) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                TabButton(title: "Tweets", currentTab: $currentTab, animation: animation)

                                TabButton(title: "Tweets & Likes", currentTab: $currentTab, animation: animation)

                                TabButton(title: "Media", currentTab: $currentTab, animation: animation)

                                TabButton(title: "Likes", currentTab: $currentTab, animation: animation)
                            }
                        }

                        Divider()
                    }
                    .padding(.top, 30)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                    .overlay(
                        GeometryReader { reader -> Color in
                            let minY = reader.frame(in: .global).minY
                            DispatchQueue.main.async {
                                self.tabBarOffset = minY
                            }
                            return Color.clear
                        }.frame(width: 0, height: 0)
                        ,alignment: .top
                    )
                    .zIndex(1)

                    #warning("タブごとにリストを分岐")
                    VStack(spacing: 18) {
                        TweetView(tweet: "Où est La Fée Clochette ? Explorez la Nouvelle Parade de #DisneylandParis25 et postez une capture d’écran si vous la trouvez !", tweetImage: "https://placehold.jp/24/cc9999/993333/150x200.png")

                        Divider()

                        ForEach(1...20, id: \.self) { _ in
                            TweetView(tweet: "Sample")
                            Divider()
                        }
                    }
                    .padding(.top)
                    .zIndex(0)

                }
                .padding(.horizontal)
                // Moving the view back if it goes > 80 ...
                .zIndex(-offset > 80 ? 0 : 1)


            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }

    func getTitleTextOffset() -> CGFloat {
        // some amount of progress for slide effect...
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }

    // Profile Shrinking Effect...
    func getOffset() -> CGFloat {
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }

    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)

        // since were scaling the view to 0.8...
        // 1.8 - 1 = 0.8...
        return scale < 1 ? scale : 1
    }

    func blurViewOpacity() -> Double {
        let progress = -(offset + 80) / 150
        return Double(-offset > 80 ? progress : 0)
    }
}

struct ParallaxAnimationAndStickyHeadersView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxAnimationAndStickyHeadersView()
    }
}

extension View {
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }
}

// Tab Button...
struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID

    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }) {

            // if i use LazyStack then the text is visible fully in scrollview...
            // may be its a bug...
            LazyVStack(spacing: 12) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .blue : .gray)
                    .padding(.horizontal)

                if currentTab == title {
                    Capsule()
                        .fill(.blue)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                else {
                    Capsule()
                        .fill(.clear)
                        .frame(height: 1.2)
                }
            }
        }
    }
}

struct TweetView: View {
    var tweet: String
    var tweetImage: String?

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KFImage(URL(string: "https://placehold.jp/24/cc9999/993333/150x150.png"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 10) {
                Text("Pokemon")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                +
                Text("  @_Pokemon")
                    .foregroundColor(.gray)

                Text(tweet)
                    .frame(maxHeight: 100, alignment: .top)

                if let image = tweetImage {
                    GeometryReader { reader in
                        KFImage(URL(string: image))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: reader.frame(in: .global).width, height: 250)
                            .cornerRadius(15)
                    }
                    .frame(height: 250)
                }
            }
        }
    }
}
