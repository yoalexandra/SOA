//
//  StoriesService.swift
//  SOA
//
//  Created by Alexandra Beznosova on 23.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

protocol StoriesServiceProtocol {
    
    typealias result = (Result<[Story], NetworkError>) -> ()
    func send(with url: URL, completion: @escaping result)
}

public class StoriesService: StoriesServiceProtocol {
    
    private var task: URLSessionDataTask?
    private let parser: Parceable
    
    init() {
        self.parser = Parser()
    }

    func send(with url: URL, completion: @escaping result) {
        task = URLSession(configuration: .default).dataTask(with: url) { [unowned self] (data,_,_) in
            defer {
                self.task = nil
            }
            if let result = self.parser.parse(data: data) {
                completion(.success(result))
            }
        }
        task?.resume()
    }
}
