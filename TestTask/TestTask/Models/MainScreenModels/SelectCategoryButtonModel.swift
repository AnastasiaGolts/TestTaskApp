//
//  SelectCategoryButtonModel.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import UIKit
import Resources

struct SelectCategoryButtonModel: Identifiable {
    var id = UUID()
    let buttonMode: SelectCategoryButtonMode
    let imageAsset: ImageAsset
    let title: String
}
