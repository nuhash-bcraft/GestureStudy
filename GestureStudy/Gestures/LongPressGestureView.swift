//
//  LongPressGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 11/10/23.
//

import SwiftUI

struct LongPressGestureView: View {
    @State private var isLongPressing = false

    var body: some View {
        VStack(spacing: 30){
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(isLongPressing ? .red : .blue)
                .gesture(
                    LongPressGesture(minimumDuration: 3)
                        .onChanged { value in
                            
                            // Respond to the long press gesture
                            print("onChange: ", value)
                            self.isLongPressing = true
                        }
                        .onEnded { value in
                            // Perform actions when the long press ends
                            print("onend: ", value)
                            self.isLongPressing = false
                        }
                )
            
            Text("Hold Me")
                .onLongPressGesture(minimumDuration: 3, maximumDistance: 50) {

                } onPressingChanged: { isPressing in
                    print("onPressing:", isPressing)
                }
        }
    }
}

struct LongPressGestureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
