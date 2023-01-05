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
				InstructionView(game: $game)
				SliderVIew(sliderValue: $sliderValue)
				HitmeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
			}
		}
	}
}


struct InstructionView: View {
	@Binding var game: Game
	var body: some View {
		VStack{
			InstructionText(text: "🎯🎯🎯\nPut the BullSEye as close as you can to")
				.padding(.leading, 30)
				.padding(.trailing, 30)
			BigNumberText(text: String(game.target))
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
			alertIsVisible = true
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
		.cornerRadius(21.0)
		.overlay(
			RoundedRectangle(cornerRadius: 21)
				.strokeBorder(Color.white, lineWidth: 1.0)
		)
		.alert("Congratulations", isPresented: $alertIsVisible) {
			Button("Awesome!") { }
		} message: {
			let roundedValue = Int(sliderValue.rounded())
			Text("You Selected \(roundedValue)\n You scored \(game.points(sliderValue: roundedValue)) points")
		}
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
