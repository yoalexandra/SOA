//
//  StoriesManager.swift
//  SOA
//
//  Created by Alexandra Beznosova on 29.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

final class StoriesManager {
    
    private let stories: TopStoriesServiceProtocol
    private let locator = ServiceLocator()
    
    init(stories: TopStoriesServiceProtocol = TopStoriesService()) {
        self.locator.registerService(service: TopStoriesService() as TopStoriesServiceProtocol)
        self.stories = locator.getService()
    }
    
    func getStories(_ completion: @escaping ((Result<[Story], NetworkError>) -> Void)) {
        
        stories.fetchStories { result in
            do {
                let data = try result.get()
                let topStories = try JSONDecoder().decode(TopStories.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(topStories.results))
                }
                print("from story manager")
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
    }
}
