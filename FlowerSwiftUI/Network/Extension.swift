//
//  Extension.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 22/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import Foundation
import Combine

enum RequestError: Error {
    case request(code: Int, message: String)
}

extension URLSession {
    func perform(request: URLRequest) -> AnyPublisher<Data, RequestError> {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .map {$0.data}
            .mapError { error in
                RequestError.request(code: error.code.rawValue, message: error.localizedDescription)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
