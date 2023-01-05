//
//  TextViews.swift
//  BullseyeApp
//
//  Created by gikwegbu on 05/01/2023.
//

import SwiftUI

struct InstructionText: View {
	var text: String
	var body: some View {
		Text(text.uppercased())
			.bold()
			.kerning(2.0)
			.foregroundColor(Color("TextColor"))
			.multilineTextAlignment(.center)
			.lineSpacing(4.0)
			.font(.footnote)
			.padding()
	}
}


struct BigNumberText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.kerning(-1.0)
			.foregroundColor(Color("TextColor"))
			.fontWeight(.black)
			.font(.largeTitle)
			.padding()
	}
}

struct SliderLabelText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.foregroundColor(Color("TextColor"))
			.frame(width: 35)
	}
}

struct LabelText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.kerning(1.5)
			.foregroundColor(Color("TextColor"))
			.font(.caption)
	}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		InstructionText(text: "Instruction Text")
		BigNumberText(text: "Big Number Text")
		SliderLabelText(text: "Slider Label Text")
		LabelText(text: "Label Text")
	}
}
