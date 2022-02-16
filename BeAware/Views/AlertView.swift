//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI
import UserNotifications
import AVFoundation
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
var audioRecorder: AVAudioRecorder?

struct AlertView : View {
    @State private var noiseLengthCounter: Double = 0
    @State private var noiseLength: Double = 2
    @State private var noiseThreshold: Double = 20
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
                            .foregroundColor(Color(hex: 0xB2CCDE))
                            .padding([.top], 20.0)
                        Slider(value: $noiseLength, in: 1...10)
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
                        Spacer(minLength: 20)
                        Text("Noise Threshold")
                            .font(Font.custom("Avenir", size: 24))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        Slider(value: $noiseThreshold, in: 0...30)
                            .padding([.top, .leading, .trailing], 30.0)
                        
                        HStack {
                            Text("Low")
                                .font(Font.custom("Avenir", size: 20))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .padding(.leading)
                            Spacer()
                            Text("High")
                                .font(Font.custom("Avenir", size: 20))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .padding(.trailing)
                            
                        }
                        Spacer(minLength: 40)
                        if !isRecording{
                            Image(systemName: "record.circle.fill")
                                .resizable().scaledToFit()
                                .shadow(color: .black, radius: 5, x: 0, y: 4)
                                .frame(width: 132, height: 132)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .accessibilityLabel("Start Noise Alert")
                                .onTapGesture {
                                    isRecording ? stopRecording() : startRecording()
                                    print(isRecording)
                                    isRecording.toggle()
                                }
                        }
                        else
                        {
                            Image(systemName: "stop.circle")
                                .resizable().scaledToFit()
                                .shadow(color: .black, radius: 5, x: 0, y: 4)
                                .frame(width: 132, height: 132)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .accessibilityLabel("Stop Noise Alert")
                                .onTapGesture {
                                    isRecording ? stopRecording() : startRecording()
                                    print(isRecording)
                                    isRecording.toggle()
                                }
                        }
                        if isRecording{
                            Text("Stop Noise Alert")
                                .font(Font.custom("Avenir", size: 24))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .padding([.bottom], 20.0)
                                .accessibilityHidden(true)
                        }
                        else{
                            Text("Start Noise Alert")
                                .font(Font.custom("Avenir", size: 24))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                                .padding([.bottom], 20.0)
                                .accessibilityHidden(true)
                        }
                    }
                }}
            .navigationTitle("Alert")
            .navigationBarTitleTextColor(Color("BrandColor"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
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
        .onReceive(timer) { input in
            print("Raven was here")
            if isRecording{
                checkNoiseLevel()
            }
        }
    }
    
    func checkNoiseLevel()
    {
        if noiseLengthCounter < noiseLength{
            noiseLengthCounter = noiseLengthCounter + 1
            return
        }
        else{
            noiseLengthCounter = 0
        }
        audioRecorder?.updateMeters()
        // NOTE: seems to be the approx correction to get real decibels
        let correction: Float = 80
        let average = (audioRecorder?.averagePower(forChannel: 0) ?? 0) + correction
        let peak = (audioRecorder?.peakPower(forChannel: 0) ?? 0) + correction
        print(peak)
        if (peak > Float(60 + noiseThreshold))
        {
            let content = UNMutableNotificationContent()
            content.title = "Noise alert notification"
            content.body = "The noise is loud at " + String(describing: Int(peak.rounded())) + "dB"
            // Configure the recurring date.
            var dateComponents = DateComponents()
            
            let date = Date()
            let calendar = Calendar.current
            dateComponents.calendar = calendar
            dateComponents.hour = calendar.component(.hour, from: date)
            dateComponents.minute = calendar.component(.minute, from: date)
            dateComponents.second = calendar.component(.second, from: date) + 1
            
            // Create the trigger as a repeating event.
            let trigger = UNCalendarNotificationTrigger(
                dateMatching: dateComponents, repeats: false)
            
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString,
                                                content: content, trigger: trigger)
            
            // Schedule the request with the system.
            let notificationCenter = UNUserNotificationCenter.current()
            
            notificationCenter.add(request) { (error) in
                if error != nil {
                    // Handle any errors.
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

func startRecording()
{
    let userNotificationCenter = UNUserNotificationCenter.current()
    let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
    userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
        if let error = error {
            print("Error: ", error)
        }
    }
    guard let url = directoryURL() else {
        print("Unable to find a init directoryURL")
        return
    }
    
    let recordSettings = [
        AVSampleRateKey : NSNumber(value: Float(44100.0) as Float),
        AVFormatIDKey : NSNumber(value: Int32(kAudioFormatMPEG4AAC) as Int32),
        AVNumberOfChannelsKey : NSNumber(value: 1 as Int32),
        AVEncoderAudioQualityKey : NSNumber(value: Int32(AVAudioQuality.medium.rawValue) as Int32),
    ]
    
    let audioSession = AVAudioSession.sharedInstance()
    
    do {
        try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
        audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
        audioRecorder?.prepareToRecord()
        audioRecorder?.record()
        try audioSession.setActive(true)
        audioRecorder?.isMeteringEnabled = true
    } catch let err {
        print("Unable start recording", err)
    }
}

func stopRecording()
{
    audioRecorder?.stop()
}

func directoryURL() -> URL? {
    let fileManager = FileManager.default
    let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = urls[0] as URL
    let soundURL = documentDirectory.appendingPathComponent("sound.m4a")
    return soundURL
}
