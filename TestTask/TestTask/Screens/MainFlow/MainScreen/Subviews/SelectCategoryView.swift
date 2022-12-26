//
//  SelectCategoryView.swift
//  TestTask
//
//  Created by Anastasia Golts on 20.12.2022.
//

import SwiftUI
import Resources

struct SelectCategoryView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    @State var buttonMode: SelectCategoryButtonMode = .phones
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }

    var body: some View {
        
        VStack {
            
            HStack {
                Text(L10n.MainScreen.SelectCategory.title)
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Spacer()
                
                Button {
                    
                } label: {
                    Text(L10n.MainScreen.SelectCategory.viewAll)
                        .font(.system(size: 15))
                        .foregroundColor(Asset.Colors.orange.swiftUIColor)
                }
                
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 17) {
                    Spacer(minLength: 5)
                    
                    ForEach(viewModel.selectCategoryButtons) { item in
                        Button {
                            buttonMode = item.buttonMode
                        } label: {
                            VStack {
                                ZStack {
                                    if buttonMode == item.buttonMode {
                                        Image(asset: Asset.Images.MainScreen.ColorCircles.orangeCircle)
                                    } else {
                                        Image(asset: Asset.Images.MainScreen.ColorCircles.whiteCircle)
                                    }

                                    Image(asset: item.imageAsset)
                                }
                                .frame(height: 71)
                                Text(item.title)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                            }
                            .frame(width: 71, height: 110)
                        }
                    }

                }
                
            }

            
        }
        
    }
}
