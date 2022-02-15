//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct EmojiBoardView : View {
    
//    var data = ["😀","🦷","🧳","🍎","🍔","🍜","🍦","🏈","🏀","🚕","🚓","🚑","🛹","🚄","✈️","🚢","➕"]
    var data = ["✈️","🍽","🏥","⏰","☕️","🎵","💦","🧻","☀️","📷","🚌","☎️","🏠","🌙","🔋","💵","➕"]
    let columns = [
        GridItem(.adaptive(minimum: 75))
    ]
    var body : some View {
        
        NavigationView{
            ZStack{
                Color("BrandColor")
                
                ScrollView{
                    VStack {
                        LazyVGrid(columns: columns, spacing: 25) {
                            ForEach(data, id: \.self) { item in
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color(hex: 0xb2ccde))
                                        .frame(width:70, height:70)                                        .shadow(color: .black, radius: 2, x: 0, y: 4)
                                    
                                    
                                    Text(item).font(Font.custom("Avenir", size: 36))
                                }.onTapGesture {
                                    //                                            data.append("A")
                                }
                                
                            }
                        }
                        .padding()
                        Spacer ()
                    }}
                .navigationTitle("Emoji Board")
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
        }
    }
}
struct EmojiBoardView_Previews : PreviewProvider {
    static var previews: some View {
        EmojiBoardView()
    }
}
