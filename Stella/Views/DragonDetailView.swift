//
//  DragonDetailView.swift
//  Stella
//
//  Created by Justin Cabral on 12/31/22.
//

import SwiftUI

struct DragonDetailView: View {
    
    public let dragon: Dragon
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack {
                            AsyncImage(url: URL(string: dragon.flickr_images[0])) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(12)
                                        .shadow(radius: 4)
                                }
                                
                                Text(dragon.description)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(12)
                                    .shadow(radius: 4)
                            }
                            .padding()
                            .cornerRadius(8)
                            .background(.white)
                            
                        
                        HStack {
                            VStack {
                                Text("Status")
                                    .font(.title2)
                                    .fontWeight(.black)
                                
                                Text(dragon.active ? "Active" : "Not In Use")
                                    .padding(20)
                                    .background(dragon.active ? .green : .red)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                            }
                            
                            Spacer()
                            
                            
                            VStack {
                                
                                Text("Type")
                                    .font(.title2)
                                    .fontWeight(.black)
                                
                                Text("\(dragon.type)")
                                    .padding(20)
                                    .background(.thinMaterial)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                            }
                        }
                        .padding(60)
            
                    }
                }
                .coordinateSpace(name: "SCROLL")
            }.navigationTitle(dragon.name)
        }
    }
}
