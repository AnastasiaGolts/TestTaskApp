//
//  ColorCapacityView.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import SwiftUI
import Resources

struct ColorCapacityView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var buttonSelected = 0
    @State var capacitySelected = 0
    
    private var buttonColors = [String]()
    private var capacityOptions = [String]()
    
    init(viewModel: Model) {
        self.viewModel = viewModel
        
        if let item = viewModel.productDetails.first {
            item.color.forEach { color in
                buttonColors.append(color)
            }
            
            item.capacity.forEach { capacity in
                capacityOptions.append(capacity)
            }
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(L10n.ProductDetailsScreen.ColorCapacityView.title)
                .font(.system(size: 16))
                .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
                .frame(width: Constants.screenWidth - 60, alignment: .leading)
            
            HStack {
                HStack(spacing: 20) {
                    ForEach(0..<buttonColors.count, id: \.self) { index in
                        Button {
                            buttonSelected = index
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(hex: buttonColors[index]))
                                if buttonSelected == index {
                                    Image(asset: Asset.Images.ProductDetailsScreen.ColorCapacityView.checkmark)
                                }
                            }
                            
                        }
                    }

                }
                
                Spacer()
                
                HStack {
                    ForEach(0..<capacityOptions.count, id: \.self) { index in
                        Button {
                            capacitySelected = index
                        } label: {
                            ZStack {
                                if capacitySelected == index {
                                    Image(asset: Asset.Images.ProductDetailsScreen.ColorCapacityView.sizeButton)
                                        .resizable()
                                        .frame(width: 72, height: 30)
                                    Text(capacityOptions[index]  + " GB")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13))
                                } else {
                                    Text(capacityOptions[index] + " GB")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13))
                                }
                                
                            }
                        }
                        .frame(width: 72)

                    }
                }
                
            }
        }
        .padding(.horizontal, 20)
    }
}
