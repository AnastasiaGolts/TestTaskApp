//
//  String.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
