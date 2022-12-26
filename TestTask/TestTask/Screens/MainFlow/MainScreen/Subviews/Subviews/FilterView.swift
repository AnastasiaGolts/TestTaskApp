//
//  FilterView.swift
//  TestTask
//
//  Created by Anastasia Golts on 24.12.2022.
//

import SwiftUI
import Resources

struct FilterView: View {
    
    // MARK: - Properties
    
    @Binding var filterViewMode: FilterViewMode
    @Binding var tabBarViewMode: TabBarViewMode
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    filterViewMode = .closed
                    tabBarViewMode = .open
                } label: {
                    ZStack {
                        Image(asset: Asset.Images.General.squareMidnightBlack)
                            .frame(width: 37, height: 37)
                        Image(asset: Asset.Images.MainScreen.FilterView.xSign)
                    }
                }
                
                Spacer()
                
                Text(L10n.MainScreen.FilterView.filterOptions)
                    .foregroundColor(Color(asset: Asset.Colors.midnightBlack))
                    .font(.system(size: 18))
                
                Spacer()
                
                Button {
                    
                } label: {
                    ZStack {
                        Image(asset: Asset.Images.MainScreen.FilterView.doneButton)
                            .frame(width: 86, height: 37)
                        Text(L10n.MainScreen.FilterView.done)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                    }
                }

            }
            .padding(.horizontal, 30)
            
            VStack (alignment: .leading) {
                Text(L10n.MainScreen.FilterView.brand)
                DropdownSelector(placeholder: DropdownOptionsValues.brandsOptions.first?.value ?? "", options: DropdownOptionsValues.brandsOptions)
            }
            .zIndex(2)
            
            VStack (alignment: .leading) {
                Text(L10n.MainScreen.FilterView.price)
                DropdownSelector(placeholder: DropdownOptionsValues.pricesOptions.first?.value ?? "", options: DropdownOptionsValues.pricesOptions)
            }
            .zIndex(1)
            
            VStack (alignment: .leading) {
                Text(L10n.MainScreen.FilterView.size)
                DropdownSelector(placeholder: DropdownOptionsValues.sizeOptions.first?.value ?? "", options: DropdownOptionsValues.sizeOptions)
            }
            
            Spacer()
            
        }
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .edgesIgnoringSafeArea([.trailing, .bottom, .leading])
        .animation(.spring(), value: filterViewMode)
        .offset(y: calculateOffset())
    }

}

private extension FilterView {
    
    // MARK: - Private Methods
    
    func calculateOffset() -> CGFloat {
        switch filterViewMode {
        case .closed:
            return Constants.screenHeight
        case .open:
            return Constants.screenHeight / 2.3
        }
    }
}
