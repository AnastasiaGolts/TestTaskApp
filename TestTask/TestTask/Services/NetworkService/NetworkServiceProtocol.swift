//
//  NetworkServiceProtocol.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import Combine

protocol NetworkServiceProtocol: AnyObject {
    func fetchMainScreenData() -> AnyPublisher<MainScreenData, Error>
    func fetchProductDetails() -> AnyPublisher<ProductDetailsData, Error>
    func fetchMyCartData() -> AnyPublisher<MyCartData, Error>
}


