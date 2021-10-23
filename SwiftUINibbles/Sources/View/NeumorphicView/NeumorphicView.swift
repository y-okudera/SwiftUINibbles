//
//  NeumorphicView.swift
//  
//
//  Created by Yuki Okudera on 2021/10/23.
//

import SwiftUI
import DesignSystem

struct NeumorphicView: View {
    @State private var isOnLightToggle = false
    @State private var isOnDarkToggle = false

    var body: some View {
        ZStack {
            LinearGradient(Color.token.gradientStartDefault, Color.token.gradientEndDefault)
            VStack(spacing: 32.0) {

                Text("Button")
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

                Text("Toggle")
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

struct NeumorphicView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            NeumorphicView().preferredColorScheme($0)
        }
    }
}
