//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct SettingsView : View {
    @State private var pushIsOn = false
    @State private var darkModeIsOn = false
    @State private var flashingLightsIsOn = false
    @State private var vibrationIsOn = false
    var body : some View {
        ZStack{
            Color("BrandColor")
        VStack {
            Spacer ()
            Text("Settings page is in progress").foregroundColor(.white)
            Toggle("Push Notifications", isOn: $pushIsOn)
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             .toggleStyle(SwitchToggleStyle(tint: .red))
             .padding(.leading, 20)
             .padding(.trailing, 20)
            Toggle("Dark Mode", isOn: $darkModeIsOn)
            .font(Font.custom("Avenir", size: 24))
            .foregroundColor(Color (hex: 0xB2CCDE))
            .toggleStyle(SwitchToggleStyle(tint: .red))
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Toggle("Flashing Lights", isOn: $flashingLightsIsOn)
            .font(Font.custom("Avenir", size: 24))
            .foregroundColor(Color (hex: 0xB2CCDE))
            .toggleStyle(SwitchToggleStyle(tint: .red))
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Toggle("Vibration", isOn: $vibrationIsOn)
            .font(Font.custom("Avenir", size: 24))
            .foregroundColor(Color (hex: 0xB2CCDE))
            .toggleStyle(SwitchToggleStyle(tint: .red))
            .padding(.leading, 20)
            .padding(.trailing, 20)
            HStack {
             Link("License Agreement", destination: URL(string: "https://www.apple.com")!)
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             .padding(.leading, 20)
             Spacer()
             Image(systemName: "chevron.right").padding(.trailing, 30)
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             
             .padding(.trailing, 20)
             }
            HStack {
             NavigationLink(destination: TutorialView()) {
             Text("Tutorial")
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             .padding(.leading, 20)
             Spacer()
             Image(systemName: "chevron.right").padding(.trailing, 30)
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             .padding(.trailing, 20)
             }
             }
            
            HStack {
             NavigationLink(destination: VideoView()) {
             Text("Video")
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             .padding(.leading, 20)
             Spacer()
             Image(systemName: "chevron.right").padding(.trailing, 30)
             .font(Font.custom("Avenir", size: 24))
             .foregroundColor(Color (hex: 0xB2CCDE))
             .padding(.trailing, 20)
             }
             }
            
            
            Spacer ()
        }
        }.navigationTitle("Settings").navigationBarTitleTextColor(Color("BrandColor"))
    }
}
struct SettingsView_Previews : PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
