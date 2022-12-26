//
//  NavigationBarView.swift
//  TestTask
//
//  Created by Anastasia Golts on 21.12.2022.
//

import SwiftUI
import Resources

struct NavigationBarView: View {
    
    var onTap: () -> Void
    
    var body: some View {
        
        HStack {
            Button {
                onTap()
            } label: {
                ZStack {
                    Image(asset: Asset.Images.General.squareMidnightBlack)
                    Image(asset: Asset.Images.General.arrow)
                }
            }
            
            Spacer()
            
            Text(L10n.MyCartScreen.NavigationBarView.address)
                .font(.system(size: 15))
                .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
            Button {
                
            } label: {
                ZStack {
                    Image(asset: Asset.Images.General.squareOrange)
                    Image(asset: Asset.Images.MyCartScreen.addressFlag)
                }
            }

        }
        .frame(width: Constants.screenWidth - 40, alignment: .center)
        .padding()
    }
}
