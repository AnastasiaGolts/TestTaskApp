//
//  ProductDetailsViewModelProtocol.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import Foundation
import Combine

protocol ProductDetailsViewModelProtocol: ObservableObject {
    var productDetails: [ProductDetailsData] { get set }
    var infoViewButtons: [InfoViewButtonModel] { get set }
    
    func returnToMainScreen()
}
