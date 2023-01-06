//
//  ContentView.swift
//  BullseyeApp
//
//  Created by gikwegbu on 04/01/2023.
//

import SwiftUI

struct ContentView: View {
	
	@State private var alertIsVisible: Bool = false
	@State private var sliderValue: Double = 50
	@State private var game: Game = Game()
	
	
	
	var body: some View {
		ZStack {
			//			Color(red: 243.0 / 255.0, green: 248.0 / 255.0, blue: 253.0 / 255.0)
			//			Color("BackgroundColor")
			//				.edgesIgnoringSafeArea(.all)
			BackgroundView(game: $game)
			VStack {
				InstructionView(game: $game, alertIsVisible: $alertIsVisible)
					.padding(.bottom, alertIsVisible ? 0 : 100)
				if alertIsVisible {
					PointsView(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue)
						.transition(.scale)
				} else {
					
					HitmeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
						.transition(.scale)
				}
			}
			if !alertIsVisible {
				
				SliderVIew(sliderValue: $sliderValue)
					.transition(.scale)
			}
		}
	}
}


struct InstructionView: View {
	@Binding var game: Game
	@Binding var alertIsVisible: Bool
	var body: some View {
		VStack{
			InstructionText(text: "🎯🎯🎯\nPut the BullSEye as close as you can to")
				.padding(.leading, 30)
				.padding(.trailing, 30)
			BigNumberText(text: String(game.target))
				.padding(.bottom, alertIsVisible ? 0 : 50)
		}
	}
}

struct SliderVIew: View {
	@Binding var sliderValue: Double
	var body: some View{
		HStack {
			SliderLabelText(text: "1")
			Slider(value: $sliderValue, in: 1.0...100.0)
			SliderLabelText(text: "100 ")
		}
		.padding()
	}
}

struct HitmeButton: View {
	@Binding var alertIsVisible: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game
	
	var body: some View {
		Button {
			withAnimation{
				alertIsVisible = true
			}
		} label: {
			Text("Hit Me".uppercased())
				.bold()
				.font(.title3)
		}
		.padding()
		.padding(.horizontal, 50)
		.background(
			ZStack {
				Color("ButtonColor")
				LinearGradient(
					gradient:
						Gradient(colors: [
							Color.white.opacity(0.3),
							Color.clear]),
					startPoint: .top, endPoint: .bottom)
			}
		)
		.foregroundColor(Color.white)
		.cornerRadius(Constants.General.roundedRectCornerRadius)
		.overlay(
			RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
				.strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
		)
		//		.alert("Congratulations", isPresented: $alertIsVisible) {
		//			let roundedValue = Int(sliderValue.rounded())
		//			let points = game.points(sliderValue: roundedValue)
		//			Button("Awesome!") {
		//				game.startNewRound(points: points)
		//			}
		//		} message: {
		//			let roundedValue = Int(sliderValue.rounded())
		//			let points = game.points(sliderValue: roundedValue)
		//			Text("You Selected \(roundedValue)\n You scored \(points) points")
		//		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
		//        ContentView()
		//            .previewLayout(.fixed(width: 568, height: 320))
		ContentView()
			.preferredColorScheme(.dark)
		//		ContentView()
		//			.preferredColorScheme(.dark)
		//			.previewLayout(.fixed(width: 568, height: 320))
	}
}
