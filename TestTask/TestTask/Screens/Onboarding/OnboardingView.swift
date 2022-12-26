//
//  OnboardingView.swift
//  TestTask
//
//  Created by Anastasia Golts on 16.12.2022.
//

import SwiftUI
import Resources

struct OnboardingView<Model>: View where Model: OnboardingViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            
            ZStack (alignment: .bottom) {
                Image(asset: Asset.Images.OnboardingScreen.splash)
                    .resizable()
                    .frame(width: Constants.screenWidth, height: Constants.screenHeight)
                
                VStack {
                    Button {
                        viewModel.startMainFlow()
                    } label: {
                        Text(L10n.OnboardingScreen.StartButton.title)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Asset.Colors.orange.swiftUIColor)
                    }
                    .frame(width: 200, height: 100)
                    Spacer()
                        .frame(height: 100)
                }

            }
            .background(Color(asset: Asset.Colors.midnightBlack))
        
        }

    }
}


