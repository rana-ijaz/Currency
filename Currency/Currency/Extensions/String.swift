//
//  String.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

extension String {
    static func isSringEmpty(_ value: String?) -> Bool {
        guard let _ = value else {
            return false
        }

        return !(value ?? "").isEmpty
    }
}
