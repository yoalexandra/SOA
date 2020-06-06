//
//  StoriesManager.swift
//  SOA
//
//  Created by Alexandra Beznosova on 29.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

class StoriesManager {
    
    static let shared = StoriesManager()
    
    private let locator = ServiceLocator.shared
    private let provider: StoriesServiceProtocol
    
    init() {
        locator.registerService(service: StoriesService() as StoriesServiceProtocol)
        provider = locator.getService()
    }
    
    func getStories(_ completion: @escaping (Result<[Story], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=uXvUwtprWyPIvJ5hWPvCR6KCDdATV5A3") else { return }
        
        provider.send(with: url) { result in
            
            do {
                let stories = try result.get()
                DispatchQueue.main.async {
                    completion(.success(stories))
                }
            } catch {
                completion(.failure(.parser(string: "Error parse data")))
            }
        }
    }
}
    

