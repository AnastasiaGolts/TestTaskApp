//
//  MyCartView.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import SwiftUI
import Resources

struct MyCartView<Model>: View where Model: MyCartViewModelProtocol {

    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            NavigationBarView(onTap: viewModel.returnToMainScreen)
            MyCartTitleView()
            Spacer()
            SelectedItemsView(viewModel: viewModel)
            TotalDeliveryView(viewModel: viewModel)
        }
        .safeAreaInset(edge: .bottom, content: {
            ButtonView()
        })
        .background(Color(asset: Asset.Colors.background))
        .navigationBarHidden(true)

    }
}
