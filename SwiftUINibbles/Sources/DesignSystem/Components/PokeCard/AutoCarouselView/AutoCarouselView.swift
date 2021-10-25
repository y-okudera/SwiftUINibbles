//
//  AutoCarouselView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/25.
//

import Combine
import SwiftUI

public struct AutoCarouselView<Page: View>: View {

    // MARK: - Properties
    @State private var currentPage: Int = 0
    private let viewControllers: [UIHostingController<Page>]
    private let timer: Publishers.Autoconnect<Timer.TimerPublisher> = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    private let isHiddenPageDot: Bool = false
    private let currentPageDotSize: CGSize = .init(width: 5, height: 5)
    private let currentPageDotFillColor: Color = .blue
    private let currentPageDotStrokeColor: Color = .blue
    private let otherPageDotSize: CGSize = .init(width: 4, height: 4)
    private let otherPageDotFillColor: Color = .white
    private let otherPageDotStrokeColor: Color = .gray

    private var numberOfPages: Int {
        viewControllers.count == 0 ? 1 : viewControllers.count
    }

    // MARK: - Initializer

    public init(views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
                .onReceive(timer) { _ in
                    currentPage = (currentPage + 1) % numberOfPages
                }
            HStack(spacing: 3) {
                ForEach(0..<numberOfPages, id: \.self) { index in
                    let size = index == currentPage ? currentPageDotSize : otherPageDotSize
                    Circle()
                        .frame(width: size.width, height: size.height)
                        .foregroundColor(index == currentPage ? currentPageDotFillColor : otherPageDotFillColor)
                        .overlay(Circle().stroke(index == currentPage ? currentPageDotStrokeColor : otherPageDotStrokeColor, lineWidth: 1))
                        .padding(.bottom, 8)
                        .animation(.spring())
                }
            }
            .if(isHiddenPageDot) { $0.hidden() }
        }
    }
}
