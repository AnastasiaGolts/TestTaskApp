//
//  AddToCartButtonView.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import SwiftUI
import Resources

struct AddToCartButtonView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: Constants.screenWidth - 60, height: 54)
                        .foregroundColor(Asset.Colors.orange.swiftUIColor)
                    HStack {
                        Text(L10n.ProductDetailsScreen.AddToCartButtonView.title)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Text("$\(viewModel.productDetails.first?.price ?? 0)")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 40)
                    .frame(width: Constants.screenWidth - 60)
                    
                }
            }
            
        }
        .frame(height: 64)
        .padding()
        .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
        
        

    }
}
