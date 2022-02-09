//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct EmojiBoardView : View {
    
    let data = ["A","B","C"]

        let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    var body : some View {
        
        NavigationView{
            ZStack{
                Color("BrandColor")
            
            VStack {
            
                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(data, id: \.self) { item in
                                        Text(item)
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
