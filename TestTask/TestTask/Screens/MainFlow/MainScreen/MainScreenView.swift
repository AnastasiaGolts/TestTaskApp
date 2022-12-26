//
//  MainScreenView.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import SwiftUI
import Resources

struct MainScreenView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var filterViewMode: FilterViewMode = .closed
    @State var tabBarViewMode: TabBarViewMode = .open
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                VStack {
                    CityView(filterViewMode: $filterViewMode, tabBarViewMode: $tabBarViewMode)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack{
                            SelectCategoryView(viewModel: viewModel)
                            SearchView()
                            HotSalesView(viewModel: viewModel)
                            BestSellerView(viewModel: viewModel)
                        }
                    }
                    .frame(width: Constants.screenWidth, height: 600)
                }
                
                FilterView(filterViewMode: $filterViewMode, tabBarViewMode: $tabBarViewMode)
                    .shadow(radius: 5)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Spacer()
            TabBarView(tabBarViewMode: $tabBarViewMode, numberOfBasketItems: viewModel.numberOfBasketItems, onTap: viewModel.showMyCartScreen)
        }
        .background(Color(asset: Asset.Colors.background))
        .navigationBarHidden(true)

    }
}
