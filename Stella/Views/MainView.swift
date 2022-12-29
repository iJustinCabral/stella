//
//  MainView.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Rockets", systemImage: "globe.americas.fill")
                }
            
            ContentView()
                .tabItem {
                    Label("Dragons", systemImage: "character.duployan")
                }
            
            ContentView()
                .tabItem {
                    Label("Drone Ships", systemImage: "ferry")
                }
            
            ContentView()
                .tabItem {
                    Label("History", systemImage: "newspaper")
                }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
