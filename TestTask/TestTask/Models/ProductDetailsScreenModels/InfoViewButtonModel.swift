//
//  InfoViewButtonModel.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import Foundation

struct InfoViewButtonModel: Identifiable {
    let id = UUID()
    let buttonMode: InfoViewButtonMode
    let title: String
}
