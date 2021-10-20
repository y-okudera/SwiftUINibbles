//
//  ContentView.swift
//  SwiftUINibbles_iOS
//
//  Created by Yuki Okudera on 2021/10/17.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var isOnLightToggle = false
    @State private var isOnDarkToggle = false

    var body: some View {
        ZStack {
            LinearGradient(Color.token.gradientStartDefault, Color.token.gradientEndDefault)
            HStack(spacing: 32.0) {

                Button(action: {
                    print("Button tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                .buttonStyle(
                    NeumorphicButtonStyle(
                        gradientStartColor: Color.token.gradientStartDefault,
                        gradientEndColor: Color.token.gradientEndDefault
                    )
                )

                Toggle(isOn: $isOnLightToggle) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                .toggleStyle(
                    NeumorphicToggleStyle(
                        gradientStartColor: Color.token.gradientStartDefault,
                        gradientEndColor: Color.token.gradientEndDefault
                    )
                )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView().preferredColorScheme($0)
        }
    }
}
