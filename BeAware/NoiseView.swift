//
//  ContentView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/2/22.
//
import AVFoundation
import UserNotifications
import SwiftUI

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
var audioRecorder: AVAudioRecorder?
struct NoiseView: View {
    @State private var isRecording = false
    var body: some View {
        VStack{
            Button(
                action: {
                    isRecording ? stopRecording() : startRecordingNoise()
                    isRecording.toggle()
                }
            ){
                isRecording ? Text("Stop Recording") : Text("Start Recording")
            }
        }
        .onReceive(timer) { input in
            if isRecording{
                checkNoiseLevel()
            }
        }
    }
}

struct NoiseView_Previews: PreviewProvider {
    static var previews: some View {
        NoiseView()
    }
}

func startRecordingNoise()
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

func checkNoiseLevel(){
    audioRecorder?.updateMeters()
     // NOTE: seems to be the approx correction to get real decibels
    let correction: Float = 80
    let average = (audioRecorder?.averagePower(forChannel: 0) ?? 0) + correction
    let peak = (audioRecorder?.peakPower(forChannel: 0) ?? 0) + correction
    if (peak > 80)
    {
        let content = UNMutableNotificationContent()
        content.title = "Noise alert notification"
        content.body = "The noise is loud at " + String(describing: peak)
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
