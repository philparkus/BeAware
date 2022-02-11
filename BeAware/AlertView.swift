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
    @State private var isRecording = false
    var body : some View {
        NavigationView{
            ZStack {
                Color("BrandColor")
                ScrollView{
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
                                .padding(.leading)
                            Spacer()
                            Text("Long")
                                .font(Font.custom("Avenir", size: 20))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .padding(.trailing)
                        }
                        Spacer(minLength: 30)
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
                                .padding(.leading)
                            Spacer()
                            Text("Long")
                                .font(Font.custom("Avenir", size: 20))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .padding(.trailing)
                            
                        }
                        Spacer(minLength: 60)
//                        Button(action: {
//                            Task
//                            {
//                            }
//                            Text("Stop Noise Alert")
//                                .font(Font.custom("Avenir", size: 24))
//                                .fontWeight(.heavy)
//                                .foregroundColor(Color(hex: 0xB2CCDE))
//                        }
//                    .padding([.top, .leading, .trailing])
//                                }
//                        {
                            if !isRecording{
                                ZStack{
//                                    Image(systemName: "mic.circle").resizable().scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(Color(hex: 0xB2CCDE ))
                                    
                                    Image(systemName: "record.circle.fill").resizable().scaledToFit()
                                        .frame(width: 132, height: 132)
                                        .foregroundColor(Color(hex: 0xB2CCDE))
                                        .onTapGesture {
                                            isRecording.toggle()
                                        }
                                    
                                }
                            }
                            else
                            {
                                Image(systemName: "stop.circle").resizable().scaledToFit()
                                    .frame(width: 132, height: 132)
                                    .foregroundColor(Color(hex: 0xB2CCDE))
                                    .onTapGesture {
                                        isRecording.toggle()
                                    }
                            }
                        }
                        Text("Stop Noise Alert")
                            .font(Font.custom("Avenir", size: 24))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        
                        
                    }}
                .padding([.top, .leading, .trailing])
                .navigationTitle("Alert").navigationBarTitleTextColor(Color("BrandColor")).toolbar{
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
