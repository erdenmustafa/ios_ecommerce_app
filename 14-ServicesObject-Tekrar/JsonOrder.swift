
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jSONOrder = try? newJSONDecoder().decode(JSONOrder.self, from: jsonData)

import Foundation

// MARK: - JSONOrder
struct JSONOrder: Codable {
    let order: [Order]
}

// MARK: - Order
struct Order: Codable {
    let durum: Bool
    let mesaj: String
}

