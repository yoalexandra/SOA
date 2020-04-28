//
//  Story.swift
//  SOA
//
//  Created by Alexandra Beznosova on 28.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import Foundation

struct Story: Codable, Equatable {
    
    let section: String
    let subsection: String
    let title: String
    let abstract: String
    let byline: String
    let url: String
}


