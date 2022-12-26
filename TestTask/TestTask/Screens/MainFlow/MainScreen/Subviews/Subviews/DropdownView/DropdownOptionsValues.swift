//
//  DropdownOptionsValues.swift
//  TestTask
//
//  Created by Anastasia Golts on 24.12.2022.
//

import Foundation
import Resources

struct DropdownOptionsValues {
    static var uniqueKey: String {
        UUID().uuidString
    }
    
    static let brandsOptions: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Brands.iPhone),
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Brands.samsung),
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Brands.xiaomi)
    ]
    
    static let pricesOptions: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Prices._0),
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Prices._1000),
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Prices._3000),
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Prices._5000),
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Prices._7000)
    ]
    
    static let sizeOptions: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: L10n.MainScreen.DropdownOptions.Size.singleOption)
    ]
}
