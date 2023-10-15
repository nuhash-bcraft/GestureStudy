//
//  HigherPriorityGestureExample.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 12/10/23.
//

import SwiftUI

struct HighPriorityGestureExample: View {
    @State private var message = "Message"
    let newGesture = TapGesture().onEnded {
        print("Tap on VStack.")
    }


    var body: some View {
        VStack(spacing:25) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .padding()
                .foregroundColor(.red)
                .onTapGesture {
                    print("Tap on image.")
                }
            Rectangle()
                .fill(Color.blue)
        }
        .highPriorityGesture(newGesture)
        .frame(width: 200, height: 200)
        .border(Color.purple)
    }
}


struct HigherPriorityGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityGestureExample()
    }
}
