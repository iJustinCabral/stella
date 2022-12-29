//
//  DragonsView.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import SwiftUI

struct DragonsView: View {
    
    @StateObject private var viewModel = StellaViewModel(service: StellaService())
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .dragonsSuccess(let dragons):
                    ScrollView {
                        ForEach(dragons, id:\.self) { dragon in
                            DragonView(dragon: dragon)
                        }
                    }
                case .loading:
                    VStack {
                        ProgressView()
                        Text("Loading Dragons...")
                    }
                case .failed(let error):
                    Text(error.localizedDescription)
                default:
                    Text("Dragon View")
                }
            }
            .navigationTitle("Dragon Capsules")
        }
        .task {
            await viewModel.getDragons()
        }
    }
    
    @ViewBuilder
    func DragonView(dragon: Dragon) -> some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: dragon.flickr_images[0])) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            
            Text(dragon.name)
                .padding(6)
                .background(.thinMaterial)
                .foregroundColor(.white)
                .fontWeight(.black)
                .offset(x: 10, y: -10)

        }
        .padding()
    }
}

struct DragonsView_Previews: PreviewProvider {
    static var previews: some View {
        DragonsView()
    }
}
