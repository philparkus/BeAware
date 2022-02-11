//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import AVFoundation
import SwiftUI
import Speech
private let audioEngine = AVAudioEngine()
private let speechRecognizer = SFSpeechRecognizer()
private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
private var recognitionTask: SFSpeechRecognitionTask?

struct SpeechView : View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    @State private var writtenText: String = ""

    var body : some View {
        NavigationView{
            
            ZStack {
                Color("BrandColor")
                
                VStack{
                    Text("I can’t hear you clearly.  I use this tool to understand what people are saying. Please speak into the mic")
                        .font(Font.custom("Avenir", size: 24))
                        .padding(.top, 30)
                        .padding([.leading, .trailing], 40.0)
                        .foregroundColor(Color (hex: 0xB2CCDE))
                    
                    Button(action: {
                        Task
                        {
                            isRecording.toggle()
                            if isRecording{
                                simpleEndHaptic()
                                player.seek(to: .zero)
                                player.play()
                                speechRecognizer.reset()
                                speechRecognizer.transcribe()
                            }
                            else{
                                simpleSuccessHaptic()
                                speechRecognizer.stopTranscribing()
                                print(speechRecognizer.transcript)
                                writtenText = speechRecognizer.transcript
                                
                            }
                        }})
                    {
                        if !isRecording{
                            ZStack{
                                Image(systemName: "mic.circle").resizable().scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color(hex: 0xB2CCDE ))
                                
                                Image(systemName: "record.circle.fill").resizable().scaledToFit()
                                    .frame(width: 132, height: 132)
                                    .foregroundColor(Color(hex: 0xB2CCDE))
                                
                            }
                        }
                        else
                        {
                            Image(systemName: "stop.circle").resizable().scaledToFit()
                                .frame(width: 132, height: 132)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                        }
                    }
                    TextEditor(
                        text: $writtenText
                    )
                        .font(.custom("Avenir", size: 16))
                        .cornerRadius(10)
                        .padding(.init(top: 12, leading: 25, bottom: 74, trailing: 25))
                }
            }
            .navigationTitle("Speech").navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleTextColor(Color("BrandColor"))                            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(
                        destination: SettingsView()
                    ) {
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                    }
                    
                }
            }
        }// clsoing bracket for navigation view
    } //closing bracket for vard body some view
}
struct SpeechView_Previews : PreviewProvider {
    static var previews: some View {
        SpeechView()
    }
}

func simpleSuccessHaptic() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}

func simpleEndHaptic() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.warning)
}

func simpleBigHaptic() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.error)
}
