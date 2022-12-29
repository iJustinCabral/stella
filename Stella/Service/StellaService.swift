//
//  StellaService.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import Foundation

protocol Service {
    func fetchRockets() async throws -> [Rocket]
}

final class StellaService: Service {
    enum APIendpoints {
        static let baseURL = "https://api.spacexdata.com/"
    }
    
    func fetchRockets() async throws -> [Rocket] {
        let urlSession = URLSession.shared
        let url = URL(string: APIendpoints.baseURL.appending("v4/rockets"))
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Rocket].self, from: data)
    }
}
