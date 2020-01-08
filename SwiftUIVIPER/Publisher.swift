//
//  Publisher.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import Combine

public extension Publisher {

    func on(queue: DispatchQueue) -> Publishers.ReceiveOn<Self, DispatchQueue> {
        self.receive(on: queue, options: nil)
    }

    func on(success: @escaping ((Self.Output) -> Void),
            failure: @escaping ((Self.Failure) -> Void)) -> AnyCancellable {
        self.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                failure(error)
            case .finished:
                break
            }
        }, receiveValue: success)
    }
}
