//
//  ProductDetailsViewModel.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import Foundation
import Combine
import Resources

final class ProductDetailsViewModel: ObservableObject, ProductDetailsViewModelProtocol {
    
    @Published var productDetails = [ProductDetailsData]()
    @Published var infoViewButtons = [InfoViewButtonModel]()
    
    // MARK: - Properties
    
    private let networkService: NetworkServiceProtocol
    private let returnToMain: () -> Void
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(networkService: NetworkServiceProtocol, returnToMain: @escaping () -> Void) {
        self.networkService = networkService
        self.returnToMain = returnToMain

        fetchProductDetails()
        configureInfoViewButtons()
    }
    
    func returnToMainScreen() {
        returnToMain()
    }
}

private extension ProductDetailsViewModel {
    
    // MARK: - Private Methods
    
    func fetchProductDetails() {
        networkService.fetchProductDetails()
            .sink { _ in
                
            } receiveValue: { [weak self] data in
                DispatchQueue.main.async {
                    self?.productDetails = [data]
                }
            }
            .store(in: &subscriptions)

    }
    
    func configureInfoViewButtons() {
        let buttons = [InfoViewButtonModel(buttonMode: .shop, title: L10n.ProductDetailsScreen.InfoViewButton.shop),
                       InfoViewButtonModel(buttonMode: .details, title: L10n.ProductDetailsScreen.InfoViewButton.details),
                       InfoViewButtonModel(buttonMode: .features, title: L10n.ProductDetailsScreen.InfoViewButton.features)]
            .publisher

        
        let _ = buttons
            .sink { [weak self] button in
                self?.infoViewButtons.append(button)
            }
            .store(in: &subscriptions)
    }
    
}
