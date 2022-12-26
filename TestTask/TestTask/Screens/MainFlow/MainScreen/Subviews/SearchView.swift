//
//  SearchView.swift
//  TestTask
//
//  Created by Anastasia Golts on 20.12.2022.
//

import SwiftUI
import Resources

struct SearchView: View {
    
    @State var text = ""
    
    var body: some View {
        HStack {
            
            Spacer(minLength: 30)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: Constants.screenWidth - 120, height: 34, alignment: .leading)
                
                HStack {
                    Spacer(minLength: 20)
                    
                    Button {
                        
                    } label: {
                        Image(asset: Asset.Images.MainScreen.SearchCell.magnifyingGlass)
                    }

                    TextField(L10n.MainScreen.SearchView.placeholder, text: $text)
                        .padding()
                }
                
            }
            
            ZStack {
                
                Image(asset: Asset.Images.MainScreen.ColorCircles.orangeCircle)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    
                Image(asset: Asset.Images.MainScreen.SearchCell.searchSign)
                    
            }
            
            Spacer(minLength: 30)
            
        }
    }
}
