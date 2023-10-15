//
//  HighPriorityGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 12/10/23.
//

import SwiftUI

struct HighPriorityGestureView: View {
    
    @State private var isLongPressing = false
    @State private var tapCount : Int = 0
    @State private var isDragging = false
    
    
    var body: some View {
        
        let longPressGesture = LongPressGesture(minimumDuration: 2, maximumDistance: 100)
            .onChanged { value in
                print("long press start")
                self.isLongPressing = true
            }
            .onEnded { value in
                print("long press end")
                self.isLongPressing = false
            }
        
        let tapGesture = TapGesture(count: 3)
            .onEnded{ _ in
                print("tap ended")
                self.tapCount += 2
            }
        let dragGesture =  DragGesture()
            .onChanged { gesture in
                
                self.isDragging = true
                print("On Change loc: ", gesture.location, "Trans: ", gesture.translation,"Start loc: ",gesture.startLocation, gesture.time)
                //print("Velocity", gestur )
                
            }
            .onEnded { gesture in
                
                self.isDragging = false
                print("On End loc: ", gesture.location, "Trans: ", gesture.translation,"Start loc: ",gesture.startLocation)
                
            }
        
        let magnificationGesture = MagnificationGesture()
            .onChanged{ value in
                print("magnification Start")
            }
            .onEnded{ value in
                print("magnification Ended")
                
            }
        
        Circle()
            .fill(isLongPressing ? Color.red : Color.blue)
            .frame(width: 300, height: 300)
            .gesture(dragGesture)
            .highPriorityGesture(longPressGesture)
            .animation(.default)
    }
}

struct HighPriorityGestureView_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityGestureView()
    }
}
