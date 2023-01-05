//
//  RoundedViews.swift
//  BullseyeApp
//
//  Created by gikwegbu on 05/01/2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("TextColor"))
			.frame(width: 56, height: 56)
			.overlay(
				Circle()
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
					.frame(width: 56, height: 56)
			)
		
	}
}

struct RoundedImageViewFilled: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("ButtonFilledTextColor"))
			.frame(width: 56, height: 56)
			.background(
				Circle()
					.fill(Color("ButtonFilledBackgroundColor"))
					.frame(width: 56, height: 56)
			)
	}
}

struct RoundRectTextView: View {
	var text: String
	
	var body: some View {
		Text(text)
			.bold()
			.kerning(-0.2)
			.font(.title3)
			.foregroundColor(Color("TextColor"))
			.frame(width: 68, height: 56)
			.overlay(
				RoundedRectangle(cornerRadius: 21)
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
					.frame(width: 56, height: 56)
			)
	}
}

struct PreviewView: View {
	var body: some View {
		VStack(spacing: 10) {
			RoundedImageViewStroked(systemName: "arrow.counterclockwise")
			RoundedImageViewFilled(systemName: "list.dash")
			RoundRectTextView(text: "0")
		}
		
	}
}

struct RoundedViews_Previews: PreviewProvider {
	static var previews: some View {
		PreviewView()
		PreviewView()
			.preferredColorScheme(.dark)
	}
}
