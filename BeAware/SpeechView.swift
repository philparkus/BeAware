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
            VStack {
                Spacer ()
                Text("Speech")
                Spacer ()
            }.navigationTitle("Speech").navigationBarTitleTextColor(Color("BrandColor"))                            .toolbar{
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
struct SpeechView_Previews : PreviewProvider {
    static var previews: some View {
        SpeechView()
    }
}
