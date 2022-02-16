//
//  AddedImages.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/15/22.
//

import SwiftUI

struct AddedImage: Identifiable, Hashable {
    let id = UUID()
    let image: UIImage
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
