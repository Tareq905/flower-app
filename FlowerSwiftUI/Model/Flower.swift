//
//  Flower.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 21/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import Foundation

struct Flower: Hashable, Identifiable, Codable {
    var id: Int
    var category: String
    var price: Double
    var instructions: String
    var photo: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "productId", category, price, instructions, photo, name
    }
}

struct Category: Hashable, Identifiable {
    var id = UUID()
    var name: String
}
