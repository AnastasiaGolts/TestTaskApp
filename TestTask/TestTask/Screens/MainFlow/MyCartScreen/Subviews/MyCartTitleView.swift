//
//  MyCartTitleView.swift
//  TestTask
//
//  Created by Anastasia Golts on 21.12.2022.
//

import SwiftUI
import Resources

struct MyCartTitleView: View {
    var body: some View {
        HStack {
            Text(L10n.MyCartScreen.MyCartTitleView.title)
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
            
            Spacer()
        }
        .frame(width: Constants.screenWidth - 40, alignment: .center)
    }

}
