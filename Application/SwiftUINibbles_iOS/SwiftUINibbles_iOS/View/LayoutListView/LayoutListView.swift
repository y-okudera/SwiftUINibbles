//
//  LayoutListView.swift
//  SwiftUINibbles_iOS
//
//  Created by Yuki Okudera on 2021/10/21.
//

import SwiftUI

struct LayoutListView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: NeumorphicView()) {
                        Text("NeumorphicView")
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
