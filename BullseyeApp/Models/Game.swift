//
//  Game.swift
//  BullseyeApp
//
//  Created by gikwegbu on 04/01/2023.
//

import Foundation

struct Game {
	var target: Int = Int.random(in: 1...100)
	var score  = 0
	var round  = 1
	
	func points(sliderValue: Int) -> Int {
		100 - abs(target - sliderValue)
	}
}
