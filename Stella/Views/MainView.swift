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
            
            DragonsView()
                .tabItem {
                    Label("Dragons", systemImage: "character.duployan")
                }
            
            ShipsView()
                .tabItem {
                    Label("Drone Ships", systemImage: "ferry")
                }
            
            HistoryView()
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
