//
//  InfoView.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import SwiftUI
import Resources

struct InfoView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var buttonMode: InfoViewButtonMode = .shop
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if let item = viewModel.productDetails.first {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.system(size: 24))
                            .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
                        HStack {
                            ForEach(0..<5) { star in
                                Image(asset: Asset.Images.ProductDetailsScreen.star)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Image(asset: Asset.Images.General.squareMidnightBlack)
                                .resizable()
                                .frame(width: 37, height: 37)
                            Image(asset: Asset.Images.ProductDetailsScreen.emptyHeart)
                        }
                    }

                }
                .padding(.horizontal, 20)
                
                HStack(alignment: .top) {
                    ForEach(viewModel.infoViewButtons) { button in
                        Button {
                            buttonMode = button.buttonMode
                        } label: {
                            if buttonMode == button.buttonMode {
                                VStack {
                                    Text(button.title)
                                        .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
                                        .font(.system(size: 20))
                                    Image(asset: Asset.Images.ProductDetailsScreen.orangeLine)
                                }
                            } else {
                                Text(button.title)
                                    .foregroundColor(Asset.Colors.lightGray.swiftUIColor)
                                    .font(.system(size: 20))
                            }
                            
                        }
                        .frame(width: Constants.screenWidth / 3.5)
                    }

                }
                .padding(.vertical, 5)
            }
            
            IconsPanelView(viewModel: viewModel)
            ColorCapacityView(viewModel: viewModel)
            AddToCartButtonView(viewModel: viewModel)

        }
        .frame(maxWidth: Constants.screenWidth, maxHeight: .infinity, alignment: .bottom)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 10)
        .edgesIgnoringSafeArea([.trailing, .bottom, .leading])
    }
}

