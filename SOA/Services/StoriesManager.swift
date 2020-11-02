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
        
        let urlRequest: RequestURL = .stories
        
        guard let request = build(urlRequest) else { return }
       
        provider.send(with: request) { result in
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
    

private extension StoriesManager {
    
    private func build(_ request: RequestURL) -> URLRequest? {
           guard let url = URL(string: request.url) else {
               return nil
           }

           var urlRequest = URLRequest(url: url)
           urlRequest.httpMethod = request.method.name

           switch request.parameters {
           case .body(let data):
               urlRequest.httpBody = data

           case .url(let dictionary):
               guard var urlComponents = URLComponents(string: request.url) else {
                   return urlRequest
               }

               urlComponents.queryItems = dictionary.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
               urlRequest.url = urlComponents.url
           case .none:
               break
           }

           return urlRequest
       }
}
