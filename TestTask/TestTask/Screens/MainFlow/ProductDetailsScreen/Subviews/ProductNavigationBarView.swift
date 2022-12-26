//
//  ProductNavigationBarView.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import SwiftUI
import Resources

struct ProductNavigationBarView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Button {
                viewModel.returnToMainScreen()
            } label: {
                ZStack {
                    Image(asset: Asset.Images.General.squareMidnightBlack)
                        .resizable()
                        .frame(width: 37, height: 37)
                    Image(asset: Asset.Images.ProductDetailsScreen.navBarArrow)
                }
            }
            
            Spacer()
            
            Text(L10n.ProductDetailsScreen.ProductNavigationBarView.title)
                .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
                .font(.system(size: 18))
            
            Spacer()
            
            Button {
                
            } label: {
                ZStack {
                    Image(asset: Asset.Images.General.squareOrange)
                        .resizable()
                        .frame(width: 37, height: 37)
                    Image(asset: Asset.Images.ProductDetailsScreen.navBarBasket)
                }
            }

        }
        .padding()
    }
}
