//
//  Parser.swift
//  SOA
//
//  Created by Alexandra Beznosova on 05.06.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

protocol Parceable {
    func parse(data: Data?) -> [Story]?
}

class Parser: Parceable {
    
    func parse(data: Data?) -> [Story]? {
        
        guard let data = data else { return nil }
        do {
            guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]  else { return nil }
            guard let items = result["results"] as? [[String: Any]] else { return nil }
            let stories = items.compactMap { self.parse(json: $0) }
            
            return stories
        } catch {
            return nil
        }
    }
    
    private func parse(json: [String: Any]) -> Story? {
        guard let title = json["title"] as? String,
            let abstract = json["abstract"] as? String
            else {
                return nil
        }
        return Story(title: title, abstract: abstract)
    }
}


