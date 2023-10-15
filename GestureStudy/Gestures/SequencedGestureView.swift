//
//  SequencedGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 12/10/23.
//

import SwiftUI

struct SequencedGestureView: View {
    @State private var tapCount = 0
    @State private var isLongPressing = false
    @State private var isDragging = false
    var body: some View {
        
        
        let longPressGesture = LongPressGesture(minimumDuration: 1, maximumDistance: 0)
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
        
        let rotationGesture = RotationGesture()
            .onChanged{ value in
                print("Rotation changed value: ", value.degrees)
            }
            .onEnded{value in
                
                print("Rotation ended value: ", value.degrees)
                
            }
        
        let combine1 = longPressGesture.sequenced(before: dragGesture)
        let combine2 = rotationGesture.sequenced(before: magnificationGesture)
        //let combine3 = combine2.sequenced(before: tapGesture)
        
        
        Circle()
            .frame(width: 300, height: 300)
            .foregroundColor(isLongPressing ? .red : .blue )
            .background(Color.yellow)
            .gesture(combine2)
        
    }
}

struct SequencedGestureView_Previews: PreviewProvider {
    static var previews: some View {
        SequencedGestureView()
    }
}
