//
//  ContentView.swift
//  SwiftUINibbles_iOS
//
//  Created by Yuki Okudera on 2021/10/17.
//

import SwiftUI
import SwiftUIText

struct ContentView: View {
    var body: some View {

        NavigationView {
            List {
                Section {
                    NavigationLink(destination: SwiftUIText()) {
                        Text("SwiftUIText")
                    }
                } header: {
                    Text("Basic")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
