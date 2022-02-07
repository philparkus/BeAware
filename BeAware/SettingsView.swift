//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct SettingsView : View {
    var body : some View {
        VStack {
            Spacer ()
            Text("Settings")
            Spacer ()
        }.navigationTitle("Settings").navigationBarTitleTextColor(Color("BrandColor"))        
    }
}
struct SettingsView_Previews : PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
