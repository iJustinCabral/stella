//
//  RocketDetailView.swift
//  Stella
//
//  Created by Justin Cabral on 12/30/22.
//

import SwiftUI

struct RocketDetailView: View {
    
    let rocket: Rocket
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack {
                            AsyncImage(url: URL(string: rocket.flickr_images[0])) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(12)
                                        .shadow(radius: 4)
                                }
                                
                                Text(rocket.description)
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
                                
                                Text(rocket.active ? "Active" : "Not In Use")
                                    .padding(20)
                                    .background(rocket.active ? .green : .red)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                            }
                            
                            Spacer()
                            
                            
                            VStack {
                                
                                Text("Sucess Rate")
                                    .font(.title2)
                                    .fontWeight(.black)
                                
                                Text("\(rocket.success_rate_pct)%")
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
            }.navigationTitle(rocket.name)
        }
    }
    
}

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView(rocket: Rocket(name: "Falcon Heavy", type: "", active: true, stages: 2, cost_per_launch: 10000, success_rate_pct: 100, first_flight: "June 2018", company: "SpaceX", description: "Worlds biggest rocket that has reached orbit since the Apollo Missions", id: "test ID", flickr_images: ["testimage"]))
    }
}
