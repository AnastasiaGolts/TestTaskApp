//
//  OnboardingCoordinator.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import SwiftUI
import Combine

final class OnboardingCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController = UIViewController()
    var wasShownOnboarding: CurrentValueSubject<Bool, Never>
    
    // MARK: - Init
    
    init(wasShownOnboarding: CurrentValueSubject<Bool, Never>) {
        self.wasShownOnboarding = wasShownOnboarding
    }
    
    // MARK: - Methods
    
    func start() {
        
        let viewModel = OnboardingViewModel { [weak self] in
            self?.wasShownOnboarding.send(true)
        }
        
        let onboardingView = OnboardingView(viewModel: viewModel)
        rootViewController = UIHostingController(rootView: onboardingView)
    }
}
