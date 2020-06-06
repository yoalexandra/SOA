//
//  NetworkError.swift
//  SOA
//
//  Created by Alexandra Beznosova on 29.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidData(string: String)
    case invalidResponse(string: String)
    case parser(string: String)
    case invalidRequest(string: String)
}
