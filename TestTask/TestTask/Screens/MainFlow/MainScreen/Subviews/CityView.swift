//
//  CityView.swift
//  TestTask
//
//  Created by Anastasia Golts on 20.12.2022.
//

import SwiftUI
import Resources

struct CityView: View {
    
    @Binding var filterViewMode: FilterViewMode
    @Binding var tabBarViewMode: TabBarViewMode
    
    var body: some View {
        HStack {
            Spacer()
            Image(asset: Asset.Images.MainScreen.CityCell.cityFlag)
            Text(L10n.MainScreen.CityView.placeholder)
            Button {
                
            } label: {
                Image(asset: Asset.Images.MainScreen.CityCell.cityArrow)
            }

            Spacer()
            Button {
                filterViewMode = .open
                tabBarViewMode = .closed
            } label: {
                Image(asset: Asset.Images.MainScreen.CityCell.filter)
            }

        }
        .padding(.horizontal)
    }
}
