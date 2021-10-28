//
//  ParallaxAnimationAndStickyHeadersView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/28.
//

import SwiftUI
import DesignSystem

public struct ParallaxAnimationAndStickyHeadersView: View {

    @State private var offset: CGFloat = 0

    @State var currentTab = "Tweets"

    // For Smooth Slide Animation...
    @Namespace var animation

    // For Dark Mode Adoption...
    @Environment(\.colorScheme) var colorScheme


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

                            // TODO: タイマーなしバナーに修正
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width,
                                       height: minY > 0 ? 180 + minY : 180,
                                       alignment: .center)
                                .cornerRadius(0)

                            BlurView()
                                .opacity(blurViewOpacity())
                        }
                        // stretchy Header...
                        .frame(height: minY > 0 ? 180 + minY : nil)
                        .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)


                    )
                }
                .frame(height: 180)
                .zIndex(1)

                // Profile Image...
                VStack {
                    HStack {
                        Image(systemName: "pencil.circle.fill")
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
                            Text("13")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)

                            Text("Followers")
                                .foregroundColor(.gray)

                            Text("900")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                                .padding(.leading, 10)

                            Text("Following")
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 8)
                    }

                    // Custom Segmented Menu...
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                TabButton(title: "Tweets", currentTab: $currentTab, animation: animation)

                                TabButton(title: "Tweets & Likes", currentTab: $currentTab, animation: animation)

                                TabButton(title: "Media", currentTab: $currentTab, animation: animation)

                                TabButton(title: "Likes", currentTab: $currentTab, animation: animation)
                            }
                        }
                    }

                }
                .padding(.horizontal)
                // Moving the view back if it goes > 80 ...
                .zIndex(-offset > 80 ? 0 : 1)


            }
        }
        .ignoresSafeArea(.all, edges: .top)
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
