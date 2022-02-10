//
//  ActivityRepository.swift
//  async-networking-example
//
//  Created by Alexandru Surdulescu on 09/02/2022.
//

import Foundation

struct ActivityRepository {
    var activity: (ActivityEndpoint) async throws -> Activity
}

extension ActivityRepository {
    /// Repository instance for prod
    static let prod = ActivityRepository(activity: { endpoint in
        let (data, error) = try await URLSession.shared.data(for: endpoint.request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(Activity.self, from: data)
        return response
    })
}
