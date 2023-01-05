//
//  Shapes.swift
//  BullseyeApp
//
//  Created by gikwegbu on 05/01/2023.
//

import SwiftUI

struct Shapes: View {
	var body: some View {
			VStack {
				Circle()
					.stroke(Color.white, lineWidth: 20.0)
//					.fill(Color.red)
					.frame(width: 200, height: 100)
				RoundedRectangle(cornerRadius: 21)
					.frame(width: 200, height: 100)
				Capsule()
					.frame(width: 200, height: 100)
				
			}
			.background(Color.green)
	}
}

struct Shapes_Previews: PreviewProvider {
	static var previews: some View {
		Shapes()
	}
}
