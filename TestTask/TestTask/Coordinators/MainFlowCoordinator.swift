//
//  MainFlowCoordinator.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import UIKit
import SwiftUI
import Combine

final class MainFlowCoordinator: Coordinator {
    
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Properties
    
    let rootViewController = UINavigationController()
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    // MARK: - Methods
    
    func start() {
        
        let viewModel = MainScreenViewModel(networkService: networkService) { [weak self] in
            self?.showMyCart()
        } showProductDetails: { [weak self] in
            self?.showDetails()
        }
        
        let mainView = MainScreenView(viewModel: viewModel)
        
        rootViewController.viewControllers = [UIHostingController(rootView: mainView)]
        
    }
    
}

private extension MainFlowCoordinator {
    
    // MARK: - Private Methods
    
    func showDetails() {
        
        let viewModel = ProductDetailsViewModel(networkService: networkService) { [weak self] in
            self?.rootViewController.popToRootViewController(animated: true)
        }
        
        let productDetailsView = ProductDetailsView(viewModel: viewModel)
        
        rootViewController.pushViewController(UIHostingController(rootView: productDetailsView), animated: true)
    }
    
    func showMyCart() {
        
        let viewModel = MyCartViewModel(networkService: networkService) { [weak self] in
            self?.rootViewController.popToRootViewController(animated: true)
        }
        
        let myCartView = MyCartView(viewModel: viewModel)
        
        rootViewController.pushViewController(UIHostingController(rootView: myCartView), animated: true)
    }

}
