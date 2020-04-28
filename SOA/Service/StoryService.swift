//
//  StoryService.swift
//  SOA
//
//  Created by Alexandra Beznosova on 23.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation


protocol TopStoriesServiceProtocol {
    func fetchStories(_ completion: @escaping ((Result<Data, NetworkError>) -> Void))
}

final class TopStoriesService: TopStoriesServiceProtocol {
  
    func fetchStories(_ completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        guard let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=uXvUwtprWyPIvJ5hWPvCR6KCDdATV5A3") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let err = error {
                print(err.localizedDescription)
                completion(.failure(.invalidRequest))
            }
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}

