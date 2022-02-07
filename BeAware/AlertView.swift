//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct AlertView : View {
    var body : some View {
        NavigationView{
            VStack {
                Spacer ()
                Text("Alert")
                Spacer ()
            }.navigationTitle("Alert").navigationBarTitleTextColor(Color("BrandColor")).toolbar{
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
struct AlertView_Previews : PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
