//
//  SimultaneousGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 12/10/23.
//

import SwiftUI

struct SimultaneousGestureView: View {
    @State private var tapCount = 0
    @State private var isLongPressing = false
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
        
        
        let tapGesture = TapGesture(count: 4)
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
                print("magnification Start: ",value)
            }
            .onEnded{ value in
                print("magnification Ended: ",value)
                
            }
        
        let rotationGesture = RotationGesture()
            .onChanged{ value in
                print("Rotation changed value: ", value.degrees)
            }
            .onEnded{value in
                
                print("Rotation ended value: ", value.degrees)
                
            }
        
        let combine1 = longPressGesture.simultaneously(with: magnificationGesture)
        let combine2 = combine1.simultaneously(with: dragGesture)
        let combine3 = combine2.simultaneously(with: tapGesture)
        let combine4 = combine3.simultaneously(with: rotationGesture)
        
        Circle()
            .frame(width: 400, height: 400)
            .foregroundColor(isLongPressing ? .red : .blue )
            .background(Color.yellow)
            .gesture(combine4)
        
    }
}

struct SimultaneousGestureView_Previews: PreviewProvider {
    static var previews: some View {
        SimultaneousGestureView()
    }
}
