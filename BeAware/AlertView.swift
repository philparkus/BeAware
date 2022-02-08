//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct AlertView : View {
    @State private var noiseLength: Double = 10
    @State private var noiseThreshold: Double = 10
    var body : some View {
        NavigationView{
            VStack {
                Spacer ()
                ZStack {
                    Color("BrandColor")
                                .ignoresSafeArea()
                VStack {
                    
                    Text("Noise Length")
                        .font(Font.custom("Avenir", size: 24))
                                        .fontWeight(.heavy)
                                        .padding([.trailing], 210)
                        .foregroundColor(Color(hex: 0xB2CCDE))
                    Slider(value: $noiseLength, in: 0...10)
                        .padding([.top, .leading, .trailing], 30.0)
                            
                    HStack {
                        Text("Short")
                            .font(Font.custom("Avenir", size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        Spacer()
                            .frame(width: 265)
                        Text("Long")
                            .font(Font.custom("Avenir", size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                    }
                    VStack {
                        Spacer()
                            .frame(height: 100)
                    }
                    Text("Noise Threshold")
                        .font(Font.custom("Avenir", size: 24))
                                        .fontWeight(.heavy)
                                        .padding([.trailing], 190)
                        .foregroundColor(Color(hex: 0xB2CCDE))
                    Slider(value: $noiseThreshold, in: 0...10)
                        .padding([.top, .leading, .trailing], 30.0)
                            
                    HStack {
                        Text("Short")
                            .font(Font.custom("Avenir", size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        Spacer()
                            .frame(width:265)
                        Text("Long")
                            .font(Font.custom("Avenir", size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        
                    }
                    VStack {
                        Spacer()
                            .frame(height: 100)
                        Button {
        //                    This button should stop alerts
                            print("Image tapped!")
                        } label: {
                            Image(systemName: "record.circle.fill")
                                .resizable()
                                    .frame(width: 75.0, height: 75.0)
                        }
                        Text("Stop Noise Alert")
                            .font(Font.custom("Avenir", size: 24))
                                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                    }
                    
                }
                }
                Spacer ()
            }.navigationTitle("Alert").navigationBarTitleTextColor(Color("BrandColor")).toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(
                        destination: SettingsView()
                    ) {
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                    }
                    
                }
            }
        }
    }
}
struct AlertView_Previews : PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
