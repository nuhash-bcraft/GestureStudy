//
//  ExclusiveGestureExample.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 15/10/23.
//

import SwiftUI

struct ExclusiveGestureExample: View {
    @State private var dragOffset = CGSize.zero
    @State private var originalPosition = CGSize.zero

    var body: some View {
      let dragGesture = DragGesture()
        .onChanged { value in
          self.dragOffset = value.translation
        }
        .onEnded { _ in
          self.originalPosition = self.dragOffset
        }

      let doubleTapGesture = TapGesture(count: 2)
        .onEnded {
          self.dragOffset = .zero
        }

      return Image(uiImage: UIImage(named: "Image")!)
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .offset(dragOffset)
        .gesture(
          doubleTapGesture.exclusively(before: dragGesture)
        )
        .animation(.easeInOut, value: dragOffset)
    }
}

struct ExclusiveGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        ExclusiveGestureExample()
    }
}
