//
//  BackgroundView.swift
//  BullseyeApp
//
//  Created by gikwegbu on 05/01/2023.
//

import SwiftUI

struct BackgroundView: View {
	@Binding var game: Game
	var body: some View {
		VStack{
			TopView(game: $game)
			Spacer()
			BottomView(game: $game)
		}
		.padding()
		.background(
			RingsView()
		)
		
	}
}

struct TopView: View {
	@State private var isRestart: Bool = false
	@Binding var game: Game
	var body: some View {
		HStack {
			Button {
				isRestart = true
			} label: {
				RoundedImageViewStroked(systemName: "arrow.counterclockwise")
			}
			.alert("Restart Game", isPresented: $isRestart) {
				Button {
				} label: {
					Text("Cancel")
				}
				Button {
					game.restart()
				} label: {
					Text("Continue")
				}
				
			} message: {
				Text("Are you sure you wanna Restart?.\nCurrent scores & round will be lost")
			}
			Spacer()
			Button {
			} label: {
				RoundedImageViewFilled(systemName: "list.dash")
			}
		}
	}
}

struct NumberView: View {
	var title: String
	var text: String
	var body: some View {
		//		Color.gray
		//			.frame(width: 56, height: 56)
		
		VStack(spacing: 5) {
			LabelText(text: title)
			RoundRectTextView(text: text)
			
		}
	}
}

struct BottomView: View {
	@Binding var game: Game
	var body: some View {
		HStack {
			NumberView(title: "Score", text: String(game.score))
			Spacer()
			NumberView(title: "Round", text: String(game.round))
		}
	}
}

struct RingsView: View {
	@Environment(\.colorScheme) var colorScheme
	
	var body: some View {
		ZStack{
			Color("BackgroundColor")
				.edgesIgnoringSafeArea(.all)
			ForEach(1..<5) {ring in
				let size = CGFloat(ring * 100)
				let opacity = colorScheme == .dark ? 0.1 : 0.3
				Circle()
				//					.strokeBorder(lineWidth: 20.0, antialiased: true)
					.stroke(lineWidth: 20.0)
					.fill(
						RadialGradient(colors: [Color("RingsColor").opacity(0.8 * opacity),Color("RingsColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300)
					)
					.frame(width: size, height: size)
			}
		}
	}
}

struct BackgroundView_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundView(game: .constant(Game()))
	}
}
