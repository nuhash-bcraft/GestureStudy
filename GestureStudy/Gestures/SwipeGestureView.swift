//
//  SwipeGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 15/10/23.
//

import SwiftUI

struct SwipeGestureView: View {
    @State private var offset: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(.blue)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        print("Translation on change", gesture.translation.width)
                        self.offset = gesture.translation.width
                    }
                    .onEnded { gesture in
                        
                        print("Translation on end", gesture.translation.width)
                        if gesture.translation.width > 100 {
                            withAnimation {
                                self.offset = 100
                            } // Swipe right
                        } else if gesture.translation.width < -100 {
                            withAnimation {
                                self.offset = -100
                            } // Swipe left
                        } else {
                            withAnimation {
                                self.offset = 0
                            }
                        }
                    }
            )
    }
}

struct SwipeGestureView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureView()
    }
}
