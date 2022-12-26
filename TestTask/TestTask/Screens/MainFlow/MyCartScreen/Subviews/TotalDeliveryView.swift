//
//  TotalDeliveryView.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import SwiftUI
import Resources

struct TotalDeliveryView<Model>: View where Model: MyCartViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Image(asset: Asset.Images.MyCartScreen.topLine)
                .resizable()
                .frame(width: Constants.screenWidth, height: 2)
            HStack {
                Text(L10n.MyCartScreen.TotalDeliveryView.total)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                Spacer()
                Text("\(viewModel.total)")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: Constants.screenWidth - 100, alignment: .center)
            HStack {
                Text(L10n.MyCartScreen.TotalDeliveryView.delivery)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                Spacer()
                Text(viewModel.delivery)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: Constants.screenWidth - 100, alignment: .center)
            Spacer()
            
        }
        .background(Color(asset: Asset.Colors.midnightBlack))
        .frame(width: Constants.screenWidth, height: 70)
    }
}
