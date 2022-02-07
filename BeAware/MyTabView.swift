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
            SpeechView()
                .tabItem {
                    Label("Speech", systemImage: "mic")
                }
            AlertView ()
                .tabItem {
                    Label("Alert", systemImage: "waveform")
                }
            EmojiBoardView()
                .tabItem {
                    Label("Emoji Board", systemImage: "checkerboard.rectangle")
                }
            TextView ()
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
