//
//  MainScreenViewModel.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import Combine
import SwiftUI
import Resources

final class MainScreenViewModel: ObservableObject, MainScreenViewModelProtocol {
    
    // MARK: - Properties
    
    @Published var homeStoreItems = [HomeStoreData]()
    @Published var bestSellerItems = [BestSellerData]()
    @Published var selectCategoryButtons = [SelectCategoryButtonModel]()
    @Published var numberOfBasketItems = 0
    
    private let networkService: NetworkServiceProtocol
    private let showMyCart: () -> Void
    private let showProductDetails: () -> Void
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(networkService: NetworkServiceProtocol,
         showMyCart: @escaping () -> Void,
         showProductDetails: @escaping () -> Void) {
        self.networkService = networkService
        self.showMyCart = showMyCart
        self.showProductDetails = showProductDetails
        
        fetchMainScreenData()
        configureSelectCategoryButtons()
        fetchNumberOfBasketItems()
    }
    
    // MARK: - Methods
    
    func showMyCartScreen() {
        showMyCart()
    }
    
    func showProductDetailsScreen() {
        showProductDetails()
    }

}

private extension MainScreenViewModel {
    // MARK: - Private Methods
    
    func fetchMainScreenData() {
        networkService.fetchMainScreenData()
            .sink { _ in
                
            } receiveValue: { data in
                DispatchQueue.main.async { [weak self] in
                    self?.homeStoreItems = data.homeStore
                    self?.bestSellerItems = data.bestSeller
                }
            }
            .store(in: &subscriptions)
    }
    
    func configureSelectCategoryButtons() {
        let buttons = [SelectCategoryButtonModel(buttonMode: .phones,
                                                 imageAsset: Asset.Images.MainScreen.MenuCell.phones,
                                                 title: L10n.MainScreen.SelectCategory.phones),
                       SelectCategoryButtonModel(buttonMode: .computer,
                                                 imageAsset: Asset.Images.MainScreen.MenuCell.computer,
                                                 title: L10n.MainScreen.SelectCategory.computer),
                       SelectCategoryButtonModel(buttonMode: .health,
                                                 imageAsset: Asset.Images.MainScreen.MenuCell.health,
                                                 title: L10n.MainScreen.SelectCategory.health),
                       SelectCategoryButtonModel(buttonMode: .books,
                                                 imageAsset: Asset.Images.MainScreen.MenuCell.books,
                                                 title: L10n.MainScreen.SelectCategory.books),
                       SelectCategoryButtonModel(buttonMode: .tools,
                                                 imageAsset: Asset.Images.MainScreen.MenuCell.books,
                                                 title: L10n.MainScreen.SelectCategory.tools)].publisher
        let _ = buttons
            .sink { [weak self] button in
                self?.selectCategoryButtons.append(button)
            }
            .store(in: &subscriptions)
    }
    
    func fetchNumberOfBasketItems() {
        networkService.fetchMyCartData()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] data in
                self?.numberOfBasketItems = data.basket.count
            }
            .store(in: &subscriptions)
    }
}

