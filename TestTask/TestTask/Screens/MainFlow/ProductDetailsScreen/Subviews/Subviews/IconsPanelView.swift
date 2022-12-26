//
//  IconsPanelView.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import SwiftUI
import Resources

struct IconsPanelView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Image(asset: Asset.Images.ProductDetailsScreen.IconsPanelView.cpuIcon)
                Text(viewModel.productDetails.first?.CPU ?? "")
                    .modifier(IconTitleModifier())
            }
            .frame(width: Constants.screenWidth / 4.5)
            
            VStack {
                Image(asset: Asset.Images.ProductDetailsScreen.IconsPanelView.cameraIcon)
                Text(viewModel.productDetails.first?.camera ?? "")
                    .modifier(IconTitleModifier())
            }
            .frame(width: Constants.screenWidth / 4.5)
            
            VStack {
                Image(asset: Asset.Images.ProductDetailsScreen.IconsPanelView.ssdIcon)
                Text(viewModel.productDetails.first?.ssd ?? "")
                    .modifier(IconTitleModifier())
            }
            .frame(width: Constants.screenWidth / 4.5)
            
            VStack {
                Image(asset: Asset.Images.ProductDetailsScreen.IconsPanelView.sdIcon)
                Text(viewModel.productDetails.first?.sd ?? "")
                    .modifier(IconTitleModifier())
            }
            .frame(width: Constants.screenWidth / 4.5)
        }
        .padding(.bottom, 10)
    }
}

struct IconTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 11))
            .foregroundColor(Asset.Colors.iconPanelGray.swiftUIColor)
    }
}
