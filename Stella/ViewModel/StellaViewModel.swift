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
    func getDragons() async {}
    func getShips() async {}
    func getHistory() async {}
}

@MainActor
final class StellaViewModel: ViewModel {
    
    enum State {
        case not_available
        case loading
        case rocketsSuccess(rockets: [Rocket])
        case dragonsSuccess(dragons: [Dragon])
        case shipsSuccess(ships: [Ship])
        case historySuccess(histories: [History])
        case failed(error: Error)
    }
    
    @Published private(set) var rockets: [Rocket] = []
    @Published private(set) var dragons: [Dragon] = []
    @Published private(set) var ships: [Ship] = []
    @Published private(set) var histories: [History] = []
    @Published private(set) var state: State = .not_available
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func getRockets() async {
        self.state = .loading
        do  {
            self.rockets = try await service.fetchRockets()
            self.state = .rocketsSuccess(rockets: self.rockets)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getDragons() async {
        do {
            self.dragons = try await service.fetchDragons()
            self.state = .dragonsSuccess(dragons: self.dragons)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getShips() async {
        do {
            self.ships = try await service.fetchShips()
            self.state = .shipsSuccess(ships: self.ships)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getHistories() async {
        do {
            self.histories = try await service.fetchHistory()
            self.state = .historySuccess(histories: self.histories)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
}
