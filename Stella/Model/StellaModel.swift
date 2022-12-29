//
//  StellaModel.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import Foundation

struct Rocket: Codable, Hashable {
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let cost_per_launch: Int
    let success_rate_pct: Int
    let first_flight: String
    let company: String
    let description: String
    let id: String
    let flickr_images: [String]
}
