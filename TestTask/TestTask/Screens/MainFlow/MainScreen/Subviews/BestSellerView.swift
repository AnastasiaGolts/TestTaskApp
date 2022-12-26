//
//  BestSellerView.swift
//  TestTask
//
//  Created by Anastasia Golts on 20.12.2022.
//

import SwiftUI
import Resources

struct BestSellerView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(L10n.MainScreen.BestSeller.title)
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
            .padding()
            
            if !viewModel.bestSellerItems.isEmpty {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.bestSellerItems) { item in
                        GridView(viewModel: viewModel, item: item)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
