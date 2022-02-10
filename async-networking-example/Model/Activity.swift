//
//  Activity.swift
//  async-networking-example
//
//  Created by Alexandru Surdulescu on 09/02/2022.
//

import Foundation

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}
