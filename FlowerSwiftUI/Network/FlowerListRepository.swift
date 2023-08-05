//
//  FlowerListRepository.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 22/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class FlowerListRepository: ObservableObject {
    var subscriber: AnyCancellable?
    
    @Published private(set) var flowers = [Flower]() {
        didSet {
            categorizedFlower()
        }
    }
    @Published private(set) var category = [String]()
    
    func fetchFlowers() {
        let urlComponents = URLComponents(string: "http://services.hanselandpetal.com/feeds/flowers.json")
        let url = urlComponents!.url

        subscriber = HTTPClient.performRequest(url: url!, decodingType: [Flower].self)
            .map {$0}
            .replaceError(with: [])
            .assign(to: \.flowers, on: self)
    }
    
    func categorizedFlower() {
        for entity in flowers {
            if !category.contains(entity.category) {
                category.append(entity.category)
            }
        }
    }
    
    deinit {
        subscriber?.cancel()
    }
}
