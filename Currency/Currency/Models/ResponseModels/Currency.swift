//
//  Currency.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

struct Currency: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}

struct CurrencySelected {
    let fromCurrency, toCurrency: String
    let fromValue, toValue: Double
}
