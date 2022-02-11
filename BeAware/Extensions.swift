//
//  Extensions.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/3/22.
//
import AVFoundation
import SwiftUI
import Speech

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

extension View {
    /// Sets the text color for a navigation bar title.
    /// - Parameter color: Color the title should be
    ///
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
    
        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor, .font:UIFont(name: "Avenir-Black", size: 24)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor, .font:UIFont(name: "Avenir-Black", size: 30)! ]
        
        return self
    }
}
