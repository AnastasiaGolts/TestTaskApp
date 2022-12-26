//
//  TabBarView.swift
//  TestTask
//
//  Created by Anastasia Golts on 20.12.2022.
//

import SwiftUI
import Resources

struct TabBarView: View {
    
    @Binding var tabBarViewMode: TabBarViewMode
    let numberOfBasketItems: Int
    
    var onTap: () -> Void
    
    init(tabBarViewMode: Binding<TabBarViewMode>, numberOfBasketItems: Int, onTap: @escaping () -> Void) {
        self._tabBarViewMode = tabBarViewMode
        self.numberOfBasketItems = numberOfBasketItems
        self.onTap = onTap
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                RoundedCorner(radius: 30, corners: [.topLeft, .topRight])
                    .foregroundColor(Asset.Colors.midnightBlack.swiftUIColor)
                    .frame(width: Constants.screenWidth, height: 92, alignment: .bottom)
                HStack(spacing: 47) {
                    Button {
                        
                    } label: {
                        HStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 8, height: 8)
                            Text(L10n.MainScreen.TabBar.explorer)
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                        }
                        
                    }

                    Button {
                        onTap()
                    } label: {
                        ZStack {
                            Image(asset: Asset.Images.MainScreen.TabBar.cartIcon)
                            
                            if numberOfBasketItems != 0 {
                                ZStack {
                                    Circle()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Asset.Colors.orange.swiftUIColor)
                                    Text("\(numberOfBasketItems)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                }
                                .offset(x: 13, y: -10)
                            }
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Image(asset: Asset.Images.MainScreen.TabBar.heartIcon)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(asset: Asset.Images.MainScreen.TabBar.personIcon)
                    }

                }
            }
            
        }
        .ignoresSafeArea()
        .animation(.spring(dampingFraction: 1), value: tabBarViewMode)
        .offset(y: calculateOffset())

    }
}

private extension TabBarView {
    func calculateOffset() -> CGFloat {
        switch tabBarViewMode {
        case .closed:
            return Constants.screenHeight
        case .open:
            return 0
        }
    }
}
