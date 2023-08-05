//
//  FlowerStore.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 23/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import SwiftUI

struct FlowerStore {
    var name: String
    var interestLevel: Interest
    
    static let `default` = Self(name: "Ibrahim", interestLevel: .love)
    
    init(name: String, interestLevel: Interest = .love) {
        self.name = name
        self.interestLevel = interestLevel
    }
    
    enum Interest: String, CaseIterable {
        case love = "Love it!"
        case like = "Likely!"
        case normal = "It's okay!"
        case unlike = "Nahh!"
    }
}
