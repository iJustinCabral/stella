//
//  ShipsView.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import SwiftUI

struct ShipsView: View {
    @StateObject private var viewModel = StellaViewModel(service: StellaService())
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .shipsSuccess(let ships):
                    ScrollView {
                        ForEach(ships, id:\.self) { ship in
                            ShipView(ship: ship)
                        }
                    }
                case .loading:
                    VStack {
                        ProgressView()
                        Text("Loading ships...")
                    }
                case .failed(let error):
                    Text(error.localizedDescription)
                default:
                    Text("Ships View")
                }
            }
            .navigationTitle("Drone Ships")
        }
        .task {
            await viewModel.getShips()
        }
    }
    
    @ViewBuilder
    func ShipView(ship: Ship) -> some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: ship.image ?? "No Image Available")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            
            Text(ship.name)
                .padding(6)
                .background(.thinMaterial)
                .foregroundColor(.white)
                .fontWeight(.black)
                .offset(x: 10, y: -10)

        }
        .padding()
    }
}

struct ShipsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipsView()
    }
}
