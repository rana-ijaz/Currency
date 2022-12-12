//
//  History.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 12/12/2022.
//

import Foundation

struct History: Codable {
    let base, endDate: String
    let rates: [String: [String: Double]]
    let startDate: String
    let success, timeseries: Bool

    enum CodingKeys: String, CodingKey {
        case base
        case endDate = "end_date"
        case rates
        case startDate = "start_date"
        case success, timeseries
    }
}
