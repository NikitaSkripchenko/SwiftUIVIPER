//
//  TodoEnvironment.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import Combine

final class TodoEnvironment: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    @Published var title: String = "Todo list" {
       willSet {
            self.objectWillChange.send()
        }
    }
}
