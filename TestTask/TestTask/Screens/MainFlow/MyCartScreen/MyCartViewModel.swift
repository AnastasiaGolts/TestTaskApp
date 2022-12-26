//
//  MyCartViewModel.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import Combine
import Foundation
import Resources

final class MyCartViewModel: ObservableObject, MyCartViewModelProtocol {
    
    // MARK: - Properties
    
    @Published var basketItems = [MyCartData.BasketItem]()
    @Published var delivery = String()
    @Published var total = Int()
    
    private let networkService: NetworkServiceProtocol
    private let returnToMain: () -> Void
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(networkService: NetworkServiceProtocol,  returnToMain: @escaping () -> Void) {
        self.networkService = networkService
        self.returnToMain = returnToMain
        
        fetchMyCartScreenData()
    }
    
    func returnToMainScreen() {
        returnToMain()
    }

}

private extension MyCartViewModel {
    func fetchMyCartScreenData() {
        networkService.fetchMyCartData()
            .sink { _ in
                
            } receiveValue: { data in
                DispatchQueue.main.async { [weak self] in
                    self?.basketItems = data.basket
                    self?.delivery = data.delivery
                    self?.total = data.total
                }
            }
            .store(in: &subscriptions)

    }
}
