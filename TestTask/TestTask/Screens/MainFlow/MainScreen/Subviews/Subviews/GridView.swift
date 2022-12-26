//
//  GridView.swift
//  TestTask
//
//  Created by Anastasia Golts on 23.12.2022.
//

import SwiftUI
import Resources

struct GridView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var isFavorite = false
    
    var item: BestSellerData
    
    init(viewModel: Model, item: BestSellerData) {
        self.viewModel = viewModel
        self.item = item
    }
    
    var body: some View {
        VStack (spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 260)
                    .foregroundColor(.white)
                
                VStack {
                    ZStack (alignment: .topTrailing) {
                        let url = URL(string: item.picture)
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty, .failure:
                                ProgressView()
                                    .frame(width: 150, height: 200)
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(height: 200)
                                    .cornerRadius(10)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .onTapGesture {
                            viewModel.showProductDetailsScreen()
                        }
                        
                        ZStack {
                            Image(asset: Asset.Images.MainScreen.ColorCircles.whiteCircle)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Button {
                                if isFavorite {
                                    isFavorite = false
                                } else {
                                    isFavorite = true
                                }

                            } label: {
                                if isFavorite {
                                    Image(asset: Asset.Images.MainScreen.BestSellerCell.filledHeart)
                                        .resizable()
                                        .frame(width: 11, height: 10)
                                } else {
                                    Image(asset: Asset.Images.MainScreen.BestSellerCell.emptyHeart)
                                        .resizable()
                                        .frame(width: 11, height: 10)
                                }

                            }
                            .frame(width: 40, height: 40)
                        }
                        .frame(width: 40, height: 40)
                        
                    }
                    
                    HStack (alignment: .bottom) {
                        Text("$\(item.discountPrice)")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("$\(item.priceWithoutDiscount)")
                            .font(.system(size: 10))
                            .fontWeight(.light)
                            .foregroundColor(Asset.Colors.lightGray.swiftUIColor)
                            .strikethrough()
                    }
                    .padding(.leading, 10)
                    
                    Text("\(item.title)")
                        .font(.system(size: 13))
                        .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
                }
            }
        }
        
    }
}
