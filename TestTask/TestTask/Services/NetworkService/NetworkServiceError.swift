//
//  NetworkServiceError.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidURL
    case invalidResponseCode(Int)
    case genericError(String)
    case decodingError(String)
    
    var errorMessageString: String {
        switch self {
        case .invalidURL:
            return "Invalid URL, request can't be proceeded"
        case .invalidResponseCode(let responseCode):
            return "Invalid response code: \(responseCode)"
        case .genericError(let error):
            return error
        case .decodingError:
            return "Decoding failed"
        }
    }
}
