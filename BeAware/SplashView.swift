//
//  SplashView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/4/22.
//

import SwiftUI

struct SplashView : View {
    @State var isActive:Bool = false
    var body : some View {
        VStack {
            if self.isActive {
                // 3.
                IntroductionView()
            }
            else{
                VStack(alignment:.center){
                    Spacer ()
                    Image("Splash")
                    Spacer ()
                }
            }
        }
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
    }
}
struct SplashView_Previews : PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
