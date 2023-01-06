//
//  Shapes.swift
//  BullseyeApp
//
//  Created by gikwegbu on 05/01/2023.
//

import SwiftUI

struct Shapes: View {
	@State private var wideShapes = true
	var body: some View {
		VStack {
			if !wideShapes {
				
				Circle()
					.stroke(Color.white, lineWidth: 20.0)
				//					.fill(Color.red)
					.frame(width: 200, height: 100)
//					.transition(.scale)
					.transition(.slide)
			}
			RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
				.frame(width: wideShapes ? 200 : 100, height: 100)
			//				.animation(.easeInOut)
			Capsule()
				.fill(Color.yellow)
				.frame(width: wideShapes ? 200 : 100, height: 100)
			Ellipse()
				.fill(Color.red)
				.frame(width: wideShapes ? 200 : 100, height: 100)
			
			Button {
				withAnimation{
					
					wideShapes.toggle()
				}
			} label: {
				Text("Animate")
			}
			
			
		}
		.background(Color.green)
	}
}

struct Shapes_Previews: PreviewProvider {
	static var previews: some View {
		Shapes()
	}
}
