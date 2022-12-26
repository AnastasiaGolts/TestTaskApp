//
//  OnboardingViewModel.swift
//  TestTask
//
//  Created by Anastasia Golts on 26.12.2022.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject, OnboardingViewModelProtocol {
    
    private let startMain: () -> Void
    
    init(startToMain: @escaping () -> Void) {
        self.startMain = startToMain
    }
    
    func startMainFlow() {
        startMain()
    }
 
}
