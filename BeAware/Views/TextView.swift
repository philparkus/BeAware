//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI
import CoreHaptics

struct TextView : View {
    @State private var engine: CHHapticEngine?
    @State private var writtenText: String = ""
    @State private var newPreset: String = ""
    var placeholderString = "Tap here to start typing"
   
        @AppStorage("items") var data:[String] = ["I would like to see the manager, to request a special accommodation!",
                                        "Why was I pulled over?",
                                        "I'm deaf/Hard of Hearing"]

    var body : some View {
        NavigationView{
            ZStack{
                Color(hex: 0x015697)
                ScrollView{
                    VStack(alignment: .leading) {
                        Text("Tap below to start typing:")
                            .font(Font.custom("Avenir", size: 17))
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        
                        TextEditor(
                            text: $writtenText
                        )
                            .shadow(color: .black, radius: 5, x: 0, y: 4)
                            .frame(height: 300)
                            .font(.custom("Avenir", size: 16))
                            .cornerRadius(10)
                            .foregroundColor(Color("BrandColor"))
                        Text("Preset phrases:")
                            .font(Font.custom("Avenir", size: 24))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hex: 0xB2CCDE))
                        //-------
                        ForEach(data, id: \.self) { item in
                            //---
                            HStack{
                                Text("\(Image(systemName: "plus")) \(item)")
                                    .font(Font.custom("Avenir", size: 17))
                                    .foregroundColor(Color(hex: 0xB2CCDE))
                                    .lineLimit(1)
                                    .accessibilityAddTraits(.isButton)
                                    .accessibilityHint("Tap to add preset phrase to the text editor above")
                                    .onTapGesture(count: 1) {
                                        writtenText += " \(item)"
                                        complexSuccess()
                                    }
                                Spacer()
                                Image(systemName: "trash")
                                    .accessibilityLabel("Delete")
                                    .accessibilityHint("Removes the preset phrase")
                                    .accessibilityAddTraits(.isButton)
                                    .foregroundColor(Color(hex: 0xB2CCDE))
                                    .onTapGesture(count: 1) {
                                        print("Right on!")
                                        complexSuccess2()
                                        for (index,value) in data.enumerated(){
                                            if value == item{
                                                data.remove(at: index)
                                                return
                                                // TODO: Fix "Fatal error: Index out of range" when similar values
                                            }
                                        }
                                    }
                                
                            }
                            //---
                        }
                        //-------
                        HStack{
                            TextField("Type here...", text: $newPreset )
                                .frame(height: 50.0)
                                .accessibilityLabel("Input a preset phrase you would like to add")
                                .font(.custom("Avenir", size: 17))
                            Button(
                                action: {
                                    print("Hi")
                                    data.append(newPreset)
                                    complexSuccess3()
                                    newPreset=""
                                }
                            ){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10).frame(width: 80, height: 40).foregroundColor(Color(hex: 0xB2CCDE)).shadow(color: .black, radius: 5, x: 0, y: 4)
                                    Text("ADD").foregroundColor(Color("BrandColor"))
                                        .font(.custom("Avenir", size: 17))
                                        .accessibilityLabel("Add")
                                        .accessibilityHint("Adds the phrase you input to a list of preset phrases")
                                }
                            }
                        }
                        Spacer()
                    }}
                .padding([.top, .leading, .trailing])
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Text").navigationBarTitleDisplayMode(.inline).font(.custom("Avenir", size:17)).navigationBarTitleTextColor(Color("BrandColor"))
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
        }
        .onAppear(perform: prepareHaptics)
        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)

    }
    // Taken from here https://www.hackingwithswift.com/books/ios-swiftui/making-vibrations-with-uinotificationfeedbackgenerator-and-core-haptics

    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func complexSuccess2() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func complexSuccess3() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}
struct TextView_Previews : PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
