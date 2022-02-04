//
//  ContentView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/2/22.
//

import SwiftUI

struct IntroductionView: View {
    @State var isActive:Bool = false
    var body: some View {
        if self.isActive {
            // 3.
            MyTabView()
        }
        else{
            ZStack{
                    Color(hex: 0x015697)
                        .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("Welcome to BeAware")
                        .font(Font.custom("Avenir", size: 18))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hex: 0xB2CCDE))
                        .padding()
                    Text("This app has 4 main functions:")
                        .font(Font.custom("Avenir", size: 18))
                        .foregroundColor(Color(hex: 0xB2CCDE))
                        .padding()
                            
                    VStack(alignment: .leading){
                        Text("\(Image(systemName: "mic")) Speech - Use this as a backup tool to convert speech to text")                .font(Font.custom("Avenir", size: 18))
                            .foregroundColor(Color(hex: 0xB2CCDE))
                            
                        Text("\(Image(systemName: "waveform")) Alert - Be alerted of short or prolonged sounds")                .font(Font.custom("Avenir", size: 18))
                            .foregroundColor(Color(hex: 0xB2CCDE))
                            
                        Text("\(Image(systemName: "checkerboard.rectangle")) Emoji Board - Select curated emojis or add ones to communicate easily")                        .font(Font.custom("Avenir", size: 18))
                            .foregroundColor(Color(hex: 0xB2CCDE))
                            
                        Text("\(Image(systemName: "keyboard")) Text - Use a text field to communicate")
                            .font(Font.custom("Avenir", size: 18))
                            .foregroundColor(Color(hex: 0xB2CCDE))
                    }.padding()
                    Spacer()
                    Button(
                        action: {
                            print("Hi")
                            self.isActive = true
                        }
                    ){
                                Text("Continue")
                                    .fontWeight(.semibold)
                                    .font(Font.custom("Avenir", size: 18))
                                    .frame(width: 190)
                                .padding()
                                .foregroundColor(Color(hex: 0x015697))
                                .background(Color(hex: 0xB2CCDE))

                    }   .cornerRadius(8)
                    Spacer()
                }
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
