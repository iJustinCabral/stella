//
//  ContentView.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = StellaViewModel(service: StellaService())
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .success(let data):
                    ScrollView {
                        ForEach(data, id: \.self) { rocket in
                            NavigationLink {
                                Text(rocket.name)
                            }
                            label: {
                                RocketView(rocket: rocket)
                            }
                        }
                    }
                case .loading:
                    VStack {
                        ProgressView()
                        Text("Loading Rockets...")
                    }
                case .not_available:
                    Button("Load Rockets") {
                        Task {
                            await viewModel.getRockets()
                        }
                    }
                    
                case .failed(let error):
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("Rockets")
        }
        .task {
            await viewModel.getRockets()
        }
    }
    
    @ViewBuilder
    func RocketView(rocket: Rocket) -> some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: rocket.flickr_images[0])) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            
            Text(rocket.name)
                .padding(6)
                .background(.thinMaterial)
                .foregroundColor(.white)
                .fontWeight(.black)
                .offset(x: 10, y: -10)
                
       
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
