//
//  Story.swift
//  SOA
//
//  Created by Alexandra Beznosova on 28.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

struct Story: Equatable {
    
    let title: String
    let abstract: String
    

    init(title: String, abstract: String) {
        self.title = title
        self.abstract = abstract
    }
}

