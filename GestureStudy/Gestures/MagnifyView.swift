//
//  MagnifyView.swift
//  VideoScrub
//
//  Created by BCL Device 18 on 11/10/23.
//

import SwiftUI

struct MagnifyView: View {

    

    @State private var currentScale: CGFloat = 1.0

    @GestureState private var zoomFactor: CGFloat = 2.0

    

    var magnification: some Gesture {

        return MagnificationGesture()

            .updating($zoomFactor) { value, scale, transaction in
                
               // print(value, scale, transaction)
                /*
                withAnimation {

                    scale = value

                }
                 */
               // self.zoomFactor = value * 10.0
                
                scale = value
                
                print("updating: ",value, scale, transaction)
                

            }

            .onChanged { value in

                //withAnimation {

                    currentScale += value
                print("change: ", value)

               // }
                

            }

            .onEnded { value in

                // do nothing
                print("end: ", value)
            }

    }

    

    var body: some View {

        Image("Image")

            .resizable()

            .aspectRatio(contentMode: .fit)

            .scaleEffect(zoomFactor * currentScale)

            .gesture(magnification)

    }

}
struct MagnifyView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyView()
    }
}
