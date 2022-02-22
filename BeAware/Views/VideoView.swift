//
//  VideoView.swift
//  BeAware
//
//  Created by Hitesh Parikh on 2/21/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var body: some View {
        ZStack{
                Color(hex: 0x015697)
            ScrollView{
                VStack{
                    VideoPlayer(player: AVPlayer(url: geturl()!)).frame(height: 400)
                }
            }
        }

    .navigationTitle("Video").navigationBarTitleTextColor(Color("BrandColor"))
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
//guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }

func geturl() ->URL?{
    guard let url = Bundle.main.url(forResource: "BeAware-tutorial", withExtension: "mp4") else { fatalError("Failed to find movie file.") }
    let audioSession = AVAudioSession.sharedInstance()
    do {
    try audioSession.setCategory(.playback)
    try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    }
        catch let err{
        print("", err)
    }
    return url
}
