//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct SpeechView : View {
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
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        
                        ZStack{
                            
                            Image(systemName: "mic.circle").resizable().scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: 0xB2CCDE ))
                            
                            Image(systemName: "record.circle.fill").resizable().scaledToFit()
                                .frame(width: 132, height: 132)
                                .foregroundColor(Color(hex: 0xB2CCDE))
                            
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color(hex: 0xB2CCDE)).padding(.init(top: 12, leading: 25, bottom: 74, trailing: 25))
                }
            }
            
            .navigationTitle("Speech")
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
