//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct EmojiBoardView : View {
    var body : some View {
        NavigationView{
            VStack {
                Spacer ()
                Text("Emoji Board")
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
struct EmojiBoardView_Previews : PreviewProvider {
    static var previews: some View {
        EmojiBoardView()
    }
}
