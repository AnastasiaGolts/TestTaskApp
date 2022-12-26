//
//  PhotoCarouselView.swift
//  TestTask
//
//  Created by Anastasia Golts on 25.12.2022.
//

import SwiftUI
import Resources

struct PhotoCarouselView<Model>: View where Model: ProductDetailsViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @State var currentIndex: Int = 0
    
    var array = [AnyView]()
    
    init(viewModel: Model) {
        self.viewModel = viewModel
        
        
        if let images = viewModel.productDetails.first?.images {
            images.forEach { imageString in
                let url = URL(string: imageString)
                let image = AsyncImage(url: url, scale: 2) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    default:
                        ProgressView()
                        
                    }
                       
                }
                array.append(AnyView(image))
            }
        }
    }
    
    var body: some View {
        if !viewModel.productDetails.isEmpty {
            HStack {
                if array.count <= 2 {
                    InfiniteCarouselView(itemHeight: 300, views: array + array + array)
                } else {
                    InfiniteCarouselView(itemHeight: 300, views: array)
                }
                
            }
        }
    }
}
