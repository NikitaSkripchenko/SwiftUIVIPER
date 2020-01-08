//
//  HTTP.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation

struct HTTP {
    
    enum Method: String {
        case get
        case post
        case put
        case delete
        case patch
    }
    
    enum Error: LocalizedError {
        case unknown(Swift.Error)
        case invalidResponse
        case statusCode(Int)
        case invalidData
    }
}
