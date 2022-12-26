//
//  MainScreenViewModelProtocol.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import Foundation
import Combine

protocol MainScreenViewModelProtocol: ObservableObject {
    var homeStoreItems: [HomeStoreData] { get set }
    var bestSellerItems: [BestSellerData] { get set }
    var selectCategoryButtons: [SelectCategoryButtonModel] { get set }
    var numberOfBasketItems: Int { get set }
    
    func showMyCartScreen()
    func showProductDetailsScreen()
}
