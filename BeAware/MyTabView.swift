//
//  MyTabView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/4/22.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Speech", systemImage: "mic")
                }
            ContentView ()
                .tabItem {
                    Label("Alert", systemImage: "waveform")
                }
            ContentView()
                .tabItem {
                    Label("Emoji Board", systemImage: "checkerboard.rectangle")
                }
            ContentView ()
                .tabItem {
                    Label("Text", systemImage: "keyboard")
                }
            }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
