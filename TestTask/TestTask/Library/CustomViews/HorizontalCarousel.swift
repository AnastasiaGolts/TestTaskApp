//
//  HorizontalCarousel.swift
//  TestTask
//
//  Created by Anastasia Golts on 23.12.2022.
//

import SwiftUI

struct HorizontalCarousel<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    init(spacing: CGFloat,
         trailingSpace: CGFloat,
         items: [T],
         index: Binding<Int>,
         content: @escaping (T) -> Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self.content = content
        self._index = index
    }
    
    var body: some View {
        
        GeometryReader { proxy in
//            let width = proxy.size.width - (trailingSpace - spacing)
//            let adjustmentWidth = (trailingSpace / 2) - spacing
//            + (currentIndex != 0 ? adjustmentWidth : 0)
            
            //let width = proxy.size.width - trailingSpace
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + adjustmentWidth + offset)
            .gesture (
                
                DragGesture()
                    .updating($offset) { value, out, _ in
                        out = value.translation.width
                    }
                    .onEnded { value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundedIndex = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundedIndex), list.count - 1), 0)
                        currentIndex = index
                    }
                    .onChanged { value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundedIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundedIndex), list.count - 1), 0)
                    }
            )

        }
        .animation(.easeInOut, value: offset == 0)
    }
}
