//
//  ApplicationCoordinator.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import SwiftUI
import UIKit
import Combine

final class ApplicationCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    let wasShownOnboarding = CurrentValueSubject<Bool,Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setUpOnboardingValue()
        
        wasShownOnboarding
            .removeDuplicates()
            .sink { [weak self] wasShown in
                if wasShown {
                    let networkService = NetworkService()
                    let mainFlowCoordinator = MainFlowCoordinator(networkService: networkService)
                    mainFlowCoordinator.start()
                    self?.childCoordinators = [mainFlowCoordinator]
                    self?.window.rootViewController = mainFlowCoordinator.rootViewController
                } else {
                    guard let wasShownOnboarding = self?.wasShownOnboarding else {
                        return
                    }
                    let onboardingCoordinator = OnboardingCoordinator(wasShownOnboarding: wasShownOnboarding)
                    onboardingCoordinator.start()
                    self?.childCoordinators = [onboardingCoordinator]
                    self?.window.rootViewController = onboardingCoordinator.rootViewController
                }
            }
            .store(in: &subscriptions)
    }
    
}

private extension ApplicationCoordinator {
    
    // MARK: - Private Methods
    
    func setUpOnboardingValue() {
        let value = UserDefaults.standard.getValueForOnboarding()
        wasShownOnboarding.send(value)
        
        wasShownOnboarding
            .filter ({ $0 })
            .sink { value in
                UserDefaults.standard.setValueForOnboarding(value: value)
            }
            .store(in: &subscriptions)
    }
}
