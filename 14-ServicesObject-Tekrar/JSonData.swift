
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jSONData = try? newJSONDecoder().decode(JSONData.self, from: jsonData)

import Foundation

// MARK: - JSONData
struct JSONData: Codable {
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case products = "Products"
    }
}

// MARK: - Product
struct Product: Codable {
    let durum: Bool
    let mesaj: String
    let bilgiler: [Bilgiler]
}

// MARK: - Bilgiler
struct Bilgiler: Codable {
    let productID, productName, brief, bilgilerDescription: String
    let price: String
    let saleInformation: SaleInformation
    let campaign: Campaign
    let campaignTitle, campaignDescription: String
    let categories: [Category]
    let image: Bool
    let images: [Image]
    let likes: Likes

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productName, brief
        case bilgilerDescription = "description"
        case price, saleInformation, campaign, campaignTitle, campaignDescription, categories, image, images, likes
    }
}

// MARK: - Campaign
struct Campaign: Codable {
    let campaignTypeID: String

    enum CodingKeys: String, CodingKey {
        case campaignTypeID = "campaignTypeId"
    }
}

// MARK: - Category
struct Category: Codable {
    let categoryID, categoryName: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categoryName
    }
}

// MARK: - Image
struct Image: Codable {
    let normal, thumb: String
}

// MARK: - Likes
struct Likes: Codable {
    let like: Like
    let dislike: Int
}

// MARK: - Like
struct Like: Codable {
    let oyToplam, ortalama: String

    enum CodingKeys: String, CodingKey {
        case oyToplam = "oy_toplam"
        case ortalama
    }
}

// MARK: - SaleInformation
struct SaleInformation: Codable {
    let saleTypeID: String
    let saleType: SaleType

    enum CodingKeys: String, CodingKey {
        case saleTypeID = "saleTypeId"
        case saleType
    }
}

enum SaleType: String, Codable {
    case satılık = "Satılık"
}

