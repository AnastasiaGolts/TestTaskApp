//
//  MyCartData.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import Foundation

struct MyCartData: Codable, Identifiable {
    
    struct BasketItem: Codable, Identifiable {
        let id: Int
        let images: String
        let price: Int
        let title: String
    }
    
    let basket: [BasketItem]
    let delivery: String
    let id: String
    let total: Int
}
