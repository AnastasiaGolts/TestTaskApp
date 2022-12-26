//
//  MainScreenData.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import Foundation

struct MainScreenData: Codable {
    let homeStore: [HomeStoreData]
    let bestSeller: [BestSellerData]
}

struct HomeStoreData: Codable, Identifiable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
}

struct BestSellerData: Codable, Identifiable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
}
