//
//  ButtonView.swift
//  TestTask
//
//  Created by Anastasia Golts on 22.12.2022.
//

import SwiftUI
import Resources

struct ButtonView: View {
    
    var body: some View {
        VStack(spacing: 27) {
            Image(asset: Asset.Images.MyCartScreen.bottomLine)
                .resizable()
                .frame(width: Constants.screenWidth, height: 2)
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 326, height: 54, alignment: .center)
                            .foregroundColor(Color(asset: Asset.Colors.orange))
                        Text(L10n.MyCartScreen.ButtonView.checkout)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                }

            }
        }

        .frame(width: Constants.screenWidth ,height: 125)
        .background(Color(asset: Asset.Colors.midnightBlack))
    }
}
