//
//  CurrencyConverter.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 12/11/20.
//

import Foundation

// MARK: - CurrencyConverter
struct CurrencyConverter: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
