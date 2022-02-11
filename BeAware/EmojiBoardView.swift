//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct EmojiBoardView : View {
    
    let data = ["😀","🦷","🧳","🍎","🍔","🍜","🍦","🏈","🏀","🚕","🚓","🚑","🛹","🚄","✈️","🚢","➕"]

    
    
        let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    var body : some View {
        
        NavigationView{
            ZStack{
                Color("BrandColor")
             
                
            VStack {
                LazyVGrid(columns: columns, spacing: 50) {
                                    ForEach(data, id: \.self) { item in
                                        ZStack{
                                            Circle()
                                                .foregroundColor(Color(hex: 0xb2ccde))
                                                .frame(width:55, height:50)
                                            
                                        Text(item)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                Spacer ()
            }.navigationTitle("Emoji Board").navigationBarTitleTextColor(Color("BrandColor"))
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
