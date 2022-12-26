//
//  UserDefaults.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import Foundation
import Resources

extension UserDefaults {
    
    func setValueForOnboarding(value: Bool) {
        UserDefaults.standard.set(value, forKey: Constants.wasShownOnboardingKey)
        UserDefaults.standard.synchronize()
    }
    
    func getValueForOnboarding() -> Bool {
        UserDefaults.standard.bool(forKey: Constants.wasShownOnboardingKey)
    }
}
