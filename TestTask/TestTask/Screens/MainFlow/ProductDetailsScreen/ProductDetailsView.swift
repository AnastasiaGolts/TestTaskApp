//
//  ProductDetailsView.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import SwiftUI
import Resources

struct ProductDetailsView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            ProductNavigationBarView(viewModel: viewModel)
            PhotoCarouselView(viewModel: viewModel)
            Spacer()
            InfoView(viewModel: viewModel)
                .edgesIgnoringSafeArea([.trailing, .bottom, .leading])
        }
        .background(Color(asset: Asset.Colors.background))
        .navigationBarHidden(true)
    }
}

