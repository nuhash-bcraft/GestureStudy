//
//  RotationGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 12/10/23.
//

import SwiftUI

struct RotationGestureView: View {
    @GestureState private var rotationAngle: Angle = .zero
    
    var body: some View {
        Text("Hello")
            .frame(width: 300, height: 300)
            .background(Color.red)
            .cornerRadius(4)
            .hueRotation(rotationAngle)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                        print("on changed value: ", value.degrees)
                    }
                    .onEnded{value in
                        
                        print("on ended value: ", value.degrees)
                        
                    }
            )
            
            .animation(.easeInOut)
    }
}
struct RotationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureView()
    }
}
