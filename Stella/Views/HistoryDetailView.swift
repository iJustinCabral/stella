//
//  HistoryDetailView.swift
//  Stella
//
//  Created by Justin Cabral on 12/31/22.
//

import SwiftUI

extension Date {
    func formatDateForTimeInterval(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
}

struct HistoryDetailView: View {
    
    let history: History
    
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack(spacing: 20) {
                    
                    HStack {
     
                        Text(Date().formatDateForTimeInterval(time: TimeInterval(history.event_date_unix)))
                            .fontWeight(.black)
                            .font(.title2)
                    }
                    
                    Text(history.details)
                
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(8)
                .shadow(radius: 4)
                
                
                
            }
            .navigationTitle("On This Day...")
            .padding()
            
            Spacer()
        
        }
    }
    
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView(history: History(title: "First Falcon 1 Launch",
                                           event_date_unix: 32343434,
                                           details: "The first sucessful launch ever for Space X"))
    }
}
