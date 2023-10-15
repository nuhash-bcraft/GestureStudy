//
//  DragGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 11/10/23.
//

import SwiftUI

struct DragGestureView: View {
    @State private var isDragging = false


    var drag: some Gesture {
        DragGesture()
        
        
            .onChanged { gesture in
                
                self.isDragging = true
                print("On Change loc: ", gesture.location, "Trans: ", gesture.translation,"Start loc: ",gesture.startLocation, gesture.time)
                //print("Velocity", gestur )
                 
            }
            .onEnded { gesture in
                
                self.isDragging = false
                print("On End loc: ", gesture.location, "Trans: ", gesture.translation,"Start loc: ",gesture.startLocation)
                
            }
    }


    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.yellow)
            .gesture(drag)
            
    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
