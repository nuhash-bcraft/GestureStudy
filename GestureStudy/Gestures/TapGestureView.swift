//
//  TapGestureView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 11/10/23.
//

import SwiftUI

struct TapGestureView: View {
    @State private var tapCount = 0

    var body: some View {
        VStack {
            Text("Tap Count: \(tapCount)")
                .padding()

            Circle()
                .frame(width: 100, height: 100)
                .gesture(
                    TapGesture(count: 4)
                        .onEnded { _ in
                            //print(_)
                            // Perform actions when the tap gesture ends
                            tapCount += 1
                            print("Tap ended. Tap count: \(tapCount)")
                        }
                )
                
        }
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
    }
}
