//
//  SelectedItemsView.swift
//  TestTask
//
//  Created by Anastasia Golts on 21.12.2022.
//

import SwiftUI
import Resources

struct SelectedItemsView<Model>: View where Model: MyCartViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(asset: Asset.Colors.midnightBlack)
                .edgesIgnoringSafeArea(.bottom)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .frame(height: 380)
            ScrollView(.vertical) {
                VStack(spacing: 40) {
                    if !viewModel.basketItems.isEmpty {
                        ForEach(viewModel.basketItems) { item in
                            HStack(spacing: 15) {
                                let url = URL(string: item.images)
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty, .failure:
                                        ProgressView()
                                            .frame(width: 89, height: 89)
                                    case .success(let image):
                                        image.resizable()
                                            .frame(width: 89, height: 89)
                                            .cornerRadius(10)
                                    @unknown default:
                                        EmptyView()
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                        Text("$\(item.price)")
                                            .font(.system(size: 20))
                                            .foregroundColor(Asset.Colors.orange.swiftUIColor)
                                    }
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        Image(asset: Asset.Images.MyCartScreen.darkGreyEllipse)
                                            .resizable()
                                            .frame(width: 26, height: 68)
                                        VStack {
                                            Text("-")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                            Text("2")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20))
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                        }
                                    }
                                    Button {
                                        
                                    } label: {
                                        Image(asset: Asset.Images.MyCartScreen.basket)
                                    }
                                }
                            }
                        }
                    }

                }
                .padding(.vertical, 40)
                .frame(width: Constants.screenWidth - 60)
                
            }
            .frame(height: 320, alignment: .top)
        }
    }
}


