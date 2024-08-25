//
//  Models.swift
//  iMarket
//
//  Created by Ben Chesser on 8/23/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// Welcome
struct Welcome: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}
