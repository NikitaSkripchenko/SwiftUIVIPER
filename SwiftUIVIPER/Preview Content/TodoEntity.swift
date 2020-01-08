//
//  TodoEntity.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import SwiftUI

struct TodoEntity: EntityInterface, Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
}
