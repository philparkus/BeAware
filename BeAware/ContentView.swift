//
//  ContentView.swift
//  BeAware
//
//  Created by Hitesh Parikh on 2/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
                  Color.purple
                      .ignoresSafeArea()
            
            //015697
        VStack{
            Text("I can’t hear you clearly.  I use this tool to understand what people are saying. Please speak into the mic")
                .font(Font.custom("Avenir", size: 24))
                //.foregroundColor(Color(hex: 0xB2CCDE)
                .fontWeight(.heavy)
                .padding([.top, .leading, .trailing], 40.0)
                

            
            
            Text("Hello, world3!")
                .padding()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                
                //primary(dark blue) color hex #015697 rgb(1, 86, 151)
                //secondary(lkight blue) color hex #B2CCDE rgb(178, 204, 222)
                //secondary Color.init(red:178, green:284, blue:222)
                
                ZStack{
                    Circle().fill(Color.init(red:0, green:284, blue:222)).frame(width: 100, height: 100)
                    Circle().fill(Color.init(red:1, green:86, blue:151)).frame(width: 50, height: 50)
                    Image(systemName: "mic")
                }
            }
            Text("h4")
            Rectangle().fill(Color.init(red:0, green:284, blue:222)).padding()
        }
    }
}
}
//}
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
