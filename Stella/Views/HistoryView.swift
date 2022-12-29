//
//  HistoryView.swift
//  Stella
//
//  Created by Justin Cabral on 12/29/22.
//

import SwiftUI

struct HistoryView: View {
    @StateObject private var viewModel = StellaViewModel(service: StellaService())
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .historySuccess(let histories):
                    List {
                        ForEach(histories, id:\.self) { history in
                            NavigationLink {
                                Text("History View")
                            } label: {
                                HistoryView(history: history)
                            }
                        }
                    }
                case .loading:
                    VStack {
                        ProgressView()
                        Text("Loading histories...")
                    }
                case .failed(let error):
                    Text(error.localizedDescription)
                default:
                    Text("History View")
                }
            }
            .navigationTitle("History")
        }
        .task {
            await viewModel.getHistories()
        }
    }
    
    @ViewBuilder
    func HistoryView(history: History) -> some View {
        Text(history.title)
            .padding(4)
            .font(.title3)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
