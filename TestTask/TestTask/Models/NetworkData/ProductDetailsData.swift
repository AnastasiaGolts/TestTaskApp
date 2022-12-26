//
//  ProductDetailsData.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import Foundation

struct ProductDetailsData: Codable, Identifiable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
