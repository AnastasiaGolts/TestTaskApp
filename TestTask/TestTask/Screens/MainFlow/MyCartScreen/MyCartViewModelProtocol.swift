//
//  MyCartViewModelProtocol.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import Foundation
import Combine

protocol MyCartViewModelProtocol: ObservableObject {
    var basketItems: [MyCartData.BasketItem] { get set }
    var delivery: String { get set }
    var total: Int { get set }
    
    func returnToMainScreen()
}
