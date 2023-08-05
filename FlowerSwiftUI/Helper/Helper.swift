//
//  Helper.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 23/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

func loadImageKF(url: String) -> KFImage {
    let imageUrl = URL(string: url)
    return KFImage(imageUrl)
}
