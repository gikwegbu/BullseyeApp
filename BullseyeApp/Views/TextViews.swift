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

struct BodyText: View {
	var text: String
	var body: some View {
		Text(text)
			.font(.subheadline)
			.bold()
			.kerning(2)
			.fontWeight(.semibold)
			.multilineTextAlignment(.center)
			.lineSpacing(12)
	}
}

struct ButtonText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.padding()
			.foregroundColor(Color.white)
			.frame(maxWidth: .infinity)
			.background(
				Color.accentColor
			)
			.cornerRadius(12)
	}
}

struct ScoreText: View {
	var score: Int
	var body: some View {
		Text(String(score))
			.bold()
			.kerning(-0.2)
			.font(.title3)
			.foregroundColor(Color("TextColor"))
	}
}

struct DateText: View {
	var date: Date
	var body: some View {
		Text(date, style: .time)
			.bold()
			.kerning(-0.2)
			.font(.title3)
			.foregroundColor(Color("TextColor"))
	}
}

struct BigBoldText: View {
	var text: String
	var body: some View{
		Text(text.uppercased())
			.kerning(2.0)
			.foregroundColor(Color("TextColor"))
			.font(.title)
			.fontWeight(.black)
		
	}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			InstructionText(text: "Instruction Text")
			BigNumberText(text: "Big Number Text")
			SliderLabelText(text: "Slider Label Text")
			LabelText(text: "Label Text")
			BodyText(text: "Body text 🎉")
			ButtonText(text: "Button text")
			ScoreText(score: 500)
			DateText(date: Date())
			BigBoldText(text: "LeaderBoard")
		}
		.padding()
	}
}
