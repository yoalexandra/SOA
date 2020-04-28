//
//  ServiceLocator.swift
//  SOA
//
//  Created by Alexandra Beznosova on 28.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

class ServiceLocator {
    private var registry : [String: Any] = [:]
    
    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }
    
    func tryGetService<T>() -> T? {
        let key = "\(T.self)"
        return registry[key] as? T
    }
    
    func getService<T>() -> T {
        let key = "\(T.self)"
        return registry[key] as! T
    }
}
