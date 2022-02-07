//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct TextView : View {
    
    @State private var writtenText: String = "Tap here to start typing"
    @State private var newPreset: String = ""
    var placeholderString = "Tap here to start typing"
    var body : some View {
        NavigationView{
            ZStack{
                Color(hex: 0x015697)
                
                VStack(alignment: .leading) {
                    TextEditor(
                        text: $writtenText
                    )
                        .frame(height: 300)
                        .font(.custom("Avenir", size: 16))
                        .cornerRadius(10)
                        .foregroundColor(self.writtenText == placeholderString ? .gray : Color("BrandColor"))
                        .onTapGesture {
                            if self.writtenText == placeholderString {
                                self.writtenText = ""
                            }
                        }
                    Text("Preset phrases:")
                        .font(Font.custom("Avenir", size: 24))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hex: 0xB2CCDE))
                    HStack{
                        Text("+ I would like to see the manager, to reque...")
                            .font(Font.custom("Avenir", size: 17))
                            .foregroundColor(Color(hex: 0xB2CCDE))
                            .lineLimit(1)
                            .onTapGesture(count: 1) {
//                                    print("Single tapped!")
                                writtenText += "I would like to see the manager, to request a special accommodation"
                                }
                    }
                    HStack{
                        TextField("Type here...", text: $newPreset )
                            .frame(height: 45.0)
                        Button(
                            action: {
                                print("Hi")
                            }
                        ){
                            Text("ADD")
                                .fontWeight(.semibold)
                                .font(Font.custom("Avenir", size: 17))
                            .foregroundColor(Color(hex: 0x015697))
                            .frame(width: 80, height: 45)
                            .padding()
                        }.cornerRadius(10)                            .background(Color(hex: 0xB2CCDE))

                    }
                    Spacer()
                }
                .padding([.top, .leading, .trailing])
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Text").navigationBarTitleTextColor(Color("BrandColor"))
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
    }
}
struct TextView_Previews : PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
