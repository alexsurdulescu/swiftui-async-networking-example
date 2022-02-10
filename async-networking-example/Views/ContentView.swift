//
//  ContentView.swift
//  async-networking-example
//
//  Created by Alexandru Surdulescu on 09/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject
    private var viewModel = ContentViewModel(ActivityRepository.prod)
    
    var body: some View {
        VStack {
            Spacer()
            
            if let activity = viewModel.activity {
                ActivityView(activity: activity)
                
                Spacer()
            } else if let status = viewModel.status {
                Text(status)
                
                Spacer()
            } else if !viewModel.isLoading {
                Image(systemName: "arrow.down")
            }
            
            Button {
                Task {
                    await viewModel.getActivity()
                }
            } label: {
                Text("Get activity")
                    .opacity(viewModel.isLoading ? 0 : 1)
                    .overlay {
                        if viewModel.isLoading { ProgressView() }
                    }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
