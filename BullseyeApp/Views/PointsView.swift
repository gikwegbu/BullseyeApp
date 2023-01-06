//
//  PointsView.swift
//  BullseyeApp
//
//  Created by gikwegbu on 06/01/2023.
//

import SwiftUI

struct PointsView: View {
	@Binding var game: Game
	@Binding var alertIsVisible: Bool
	@Binding var sliderValue: Double
	
	var body: some View {
		let roundedValue = Int(sliderValue.rounded())
		let points = game.points(sliderValue: roundedValue)
		VStack(spacing: 10) {
			InstructionText(text: "The slider's value is")
			BigNumberText(text: "\(roundedValue)")
			BodyText(text: "You scored \(points) Points\n 🎉🎉🎉")
			Button {
				withAnimation{
					alertIsVisible = false
				}
				game.startNewRound(points: points)
			} label: {
				ButtonText(text: "Start New Round")
			}

		}
			.padding()
			.frame(maxWidth: 300)
			.background(Color("BackgroundColor"))
			.cornerRadius(Constants.General.roundedRectCornerRadius)
			.shadow(color: Color.gray, radius: 10, x: 5, y: 5)
			.transition(.scale)
	}
}

struct PointsView_Previews: PreviewProvider {
	static private var alertIsVisible = Binding.constant(false)
	static private var sliderValue = Binding.constant(50.0)
	static private var game = Binding.constant(Game())
	
	static var previews: some View {
		PointsView(game: game, alertIsVisible: alertIsVisible, sliderValue: sliderValue)
		PointsView(game: game, alertIsVisible: alertIsVisible, sliderValue: sliderValue)
			.preferredColorScheme(.dark)
	}
}
