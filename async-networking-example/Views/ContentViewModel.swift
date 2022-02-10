//
//  ContentViewModel.swift
//  async-networking-example
//
//  Created by Alexandru Surdulescu on 09/02/2022.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published
    var status: String? = nil
    
    @Published
    var isLoading: Bool = false
    
    @Published
    var activity: Activity? = nil
    
    private let activityRepository: ActivityRepository
    
    init(_ activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }
    
    func getActivity() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            /// Artificial delay to simulate longer task
            try? await Task.sleep(nanoseconds: UInt64(2 * 1_000_000_000))
            
            activity = try await activityRepository.activity(.retrieve)
        } catch {
            status = "Failed to get activity"
        }
    }
}
