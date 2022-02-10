//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct TextView : View {
    
    @State private var writtenText: String = ""
    @State private var newPreset: String = ""
    var placeholderString = "Tap here to start typing"
    @State private var data:[String] = ["I would like to see the manager, to request a special accommodation!",
                "Why was I pulled over?",
                "I'm deaf/Hard of Hearing"]

        let rows = [
            GridItem(.adaptive(minimum: 80))
        ]
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
    //                                .swipeActions(edge: .leading){
    //                                    Button("X") {
    //                                        print("Right on!")
    //                                    }
    //                                    .tint(.red)
    //                                }
                                    .font(Font.custom("Avenir", size: 17))
                                    .foregroundColor(Color(hex: 0xB2CCDE))
                                    .lineLimit(1)
                                    .onTapGesture(count: 1) {
                                        writtenText += " \(item)"
                                    }
                                Spacer()
                                Image(systemName: "trash")
                                        .foregroundColor(Color(hex: 0xB2CCDE))
                                        .onTapGesture(count: 1) {
                                            print("Right on!")
                                            for (index,value) in data.enumerated(){
                                                if value == item{
                                                    data.remove(at: index-1)
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
                            .font(.custom("Avenir", size: 17))
                        Button(
                            action: {
                                print("Hi")
                                data.append(newPreset)
                            }
                        ){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).frame(width: 80, height: 40).foregroundColor(Color(hex: 0xB2CCDE)).shadow(color: .black, radius: 5, x: 0, y: 4)
                                Text("ADD").foregroundColor(Color("BrandColor"))
                                    .font(.custom("Avenir", size: 17))
                            }
                        }
                    }
                    Spacer()
                }}
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
