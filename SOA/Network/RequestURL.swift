//
//  RequestURL.swift
//  SOA
//
//  Created by Alexandra Beznosova on 07.06.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

enum Parameters {
    case body(Data)
    case url([String: String?])
    case none
}

enum HTTPMethod: String {
    case post
    case put
    case get
    case delete
    case patch
    
    var name: String {
        return rawValue.uppercased()
    }
}

enum RequestURL {
    
    case stories
    
    var url: String {
        switch self {
        case .stories:
            return "https://api.nytimes.com/svc/topstories/v2/world.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .stories:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .stories:
            return .url(["api-key": "uXvUwtprWyPIvJ5hWPvCR6KCDdATV5A3"])
        }
    }
}


