//
//  StellaViewModel.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import Foundation

protocol ViewModel: ObservableObject {}

extension ViewModel {
    func getRockets() async {}
}

@MainActor
final class StellaViewModel: ViewModel {
    
    enum State {
        case not_available
        case loading
        case success(data: [Rocket])
        case failed(error: Error)
    }
    
    @Published private(set) var rockets: [Rocket] = []
    @Published private(set) var state: State = .not_available
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func getRockets() async {
        self.state = .loading
        do  {
            self.rockets = try await service.fetchRockets()
            self.state = .success(data: self.rockets)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
}
