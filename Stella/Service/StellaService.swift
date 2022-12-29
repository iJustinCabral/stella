//
//  StellaService.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import Foundation

protocol Service {
    func fetchRockets() async throws -> [Rocket]
    func fetchDragons() async throws -> [Dragon]
    func fetchShips() async throws -> [Ship]
    func fetchHistory() async throws -> [History]
}

final class StellaService: Service {
    enum APIendpoints {
        static let baseURL = "https://api.spacexdata.com/"
        static let rocketsURL = "https://api.spacexdata.com/v4/rockets"
        static let dragonsURL = "https://api.spacexdata.com/v4/dragons"
        static let shipsURL = "https://api.spacexdata.com/v4/ships"
        static let historyURL = "https://api.spacexdata.com/v4/history"
    }
    
    func fetchRockets() async throws -> [Rocket] {
        let urlSession = URLSession.shared
        let url = URL(string: APIendpoints.rocketsURL)
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Rocket].self, from: data)
    }
    
    func fetchDragons() async throws -> [Dragon]  {
        let urlSession = URLSession.shared
        let url = URL(string: APIendpoints.dragonsURL)
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Dragon].self, from: data)
    }
    
    func fetchShips() async throws -> [Ship]  {
        let urlSession = URLSession.shared
        let url = URL(string: APIendpoints.shipsURL)
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Ship].self, from: data)
    }
    
    func fetchHistory() async throws -> [History]  {
        let urlSession = URLSession.shared
        let url = URL(string: APIendpoints.historyURL)
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([History].self, from: data)
    }
}
