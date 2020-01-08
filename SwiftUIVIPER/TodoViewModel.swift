//
//  TodoViewModel.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class TodoViewModel: ObservableObject {
 
    let objectWillChange = ObservableObjectPublisher()
   
    @Published var error: Bool = false {
        willSet {
            self.objectWillChange.send()
        }
    }

    @Published var todos: [TodoEntity] = [] {
       willSet {
            self.objectWillChange.send()
        }
    }
}
