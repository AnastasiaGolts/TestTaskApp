//
//  HotSalesView.swift
//  TestTask
//
//  Created by Anastasia Golts on 20.12.2022.
//

import SwiftUI
import Resources

struct HotSalesView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var currentIndex: Int = 0
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(L10n.MainScreen.HotSales.title)
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Spacer()
                
                Button {
                    
                } label: {
                    Text(L10n.MainScreen.General.seeMore)
                        .font(.system(size: 15))
                        .foregroundColor(Asset.Colors.orange.swiftUIColor)
                }
                
            }
            .padding(.horizontal)
            
            if !viewModel.homeStoreItems.isEmpty {
                HStack {
                    HorizontalCarousel(spacing: 15,
                                       trailingSpace: 15,
                                       items: viewModel.homeStoreItems,
                                       index: $currentIndex) { item in
                        GeometryReader { proxy in
                            
                            ZStack(alignment: .leading) {
                                let url = URL(string: item.picture)
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty, .failure:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: proxy.size.width)
                                .cornerRadius(10)
                                
                                VStack (alignment: .leading, spacing: 20) {
                                    if item.isNew != nil {
                                        ZStack {
                                            Image(asset: Asset.Images.MainScreen.ColorCircles.orangeCircle)
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .aspectRatio(contentMode: .fill)
                                            Text(L10n.MainScreen.HotSales.new)
                                                .font(.system(size: 10))
                                                .underline()
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                    ZStack (alignment: .leading) {
                                        LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .leading, endPoint: .trailing)
                                            .mask (
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(minHeight: 50,
                                                           idealHeight: 80,
                                                           maxHeight: 100)
                                                    .blur(radius: 5)
                                            )
                                            .cornerRadius(10)
                                        
                                        VStack (alignment: .leading) {
                                            Text(item.title)
                                                .font(.system(size: 25))
                                                .fontWeight(.bold)
                                                .underline()
                                                .foregroundColor(.white)
                                            Text(item.subtitle)
                                                .font(.system(size: 11))
                                                .underline()
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                    Button {
                                        viewModel.showProductDetailsScreen()
                                    } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(width: 98, height: 23, alignment: .center)
                                                .foregroundColor(.white)
                                            Text(L10n.MainScreen.HotSales.buyNow)
                                                .font(.system(size: 11))
                                                .underline()
                                                .foregroundColor(.black)
                                        }

                                    }
                                    .frame(width: 98, height: 23)
                                    .foregroundColor(.white)

                                }
                                .frame(width: 147, height: 160)
                                .padding(.leading, 15)
                            }
                            

                        }

                    }
                }
                .frame(height: 200)
            }
            
        }
        

    }
}
