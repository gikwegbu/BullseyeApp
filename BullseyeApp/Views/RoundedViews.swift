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
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.overlay(
				Circle()
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
					.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			)
		
	}
}

struct RoundedImageViewFilled: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("ButtonFilledTextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.background(
				Circle()
					.fill(Color("ButtonFilledBackgroundColor"))
					.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
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
			.frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedViewLength)
			.overlay(
				RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
					.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			)
	}
}


struct RoundedTextView: View {
	var text: String
	var body: some View {
		Text(text)
			.font(.title)
			.foregroundColor(Color("TextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.overlay(
				Circle()
					.strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
					.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			)
		
	}
}

struct PreviewView: View {
	var body: some View {
		VStack(spacing: 10) {
			RoundedImageViewStroked(systemName: "arrow.counterclockwise")
			RoundedImageViewFilled(systemName: "list.dash")
			RoundRectTextView(text: "0")
			RoundedTextView(text: "1")
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
