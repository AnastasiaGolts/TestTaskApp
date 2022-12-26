//
//  NetworkService.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import Combine
import Foundation

final class NetworkService: ObservableObject, NetworkServiceProtocol {
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchMainScreenData() -> AnyPublisher<MainScreenData, Error> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            return Fail(error: NetworkServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                if let httpResponse = response as? HTTPURLResponse {
                    guard (200..<300) ~= httpResponse.statusCode else {
                        throw NetworkServiceError
                            .invalidResponseCode(httpResponse.statusCode)
                    }
                }
                return data
            }
            .decode(type: MainScreenData.self, decoder: decoder)
            .mapError { error -> NetworkServiceError in
                guard let error = error as? DecodingError else {
                    return NetworkServiceError.genericError(error.localizedDescription)
                }
                return NetworkServiceError.decodingError((error as NSError).debugDescription)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchProductDetails() -> AnyPublisher<ProductDetailsData, Error> {
        guard let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") else {
            return Fail(error: NetworkServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                if let httpResponse = response as? HTTPURLResponse {
                    guard (200..<300) ~= httpResponse.statusCode else {
                        throw NetworkServiceError
                            .invalidResponseCode(httpResponse.statusCode)
                    }
                }
                return data
            }
            .decode(type: ProductDetailsData.self, decoder: JSONDecoder())
            .mapError { error -> NetworkServiceError in
                guard let error = error as? DecodingError else {
                    return NetworkServiceError.genericError(error.localizedDescription)
                }
                return NetworkServiceError.decodingError((error as NSError).debugDescription)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchMyCartData() -> AnyPublisher<MyCartData, Error> {
        guard let url = URL(string: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149") else {
            return Fail(error: NetworkServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                if let httpResponse = response as? HTTPURLResponse {
                    guard (200..<300) ~= httpResponse.statusCode else {
                        throw NetworkServiceError
                            .invalidResponseCode(httpResponse.statusCode)
                    }
                }
                return data
            }
            .decode(type: MyCartData.self, decoder: JSONDecoder())
            .mapError { error -> NetworkServiceError in
                guard let error = error as? DecodingError else {
                    return NetworkServiceError.genericError(error.localizedDescription)
                }
                return NetworkServiceError.decodingError((error as NSError).debugDescription)
            }
            .eraseToAnyPublisher()
    }
    
}
