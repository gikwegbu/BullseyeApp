//
//  Game.swift
//  BullseyeApp
//
//  Created by gikwegbu on 04/01/2023.
//

import Foundation

struct LeaderboardEntry {
	let score: Int
	let date: Date
}

struct Game {
	var target: Int = Int.random(in: 1...100)
	var score  = 0
	var round  = 1
	var leaderboardEntries: [LeaderboardEntry] = []
	
	func points(sliderValue: Int) -> Int {
		let diff = abs(target - sliderValue)
		let bonus: Int
		
		if diff == 0 {
			bonus = 100
		} else if diff <= 2 {
			bonus = 50
		} else {
			bonus = 0
		}
		return 100 - diff + bonus
	}
	
	mutating func startNewRound(points: Int) {
		score += points
		round += 1
		target = Int.random(in: 1...100)
		addToLeaderboard(points: points)
	}
	
	mutating func restart() {
		score = 0
		round = 1
		target = Int.random(in: 1...100)
	}
	
	mutating func addToLeaderboard(points: Int) {
		// Adding entries
		leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
		leaderboardEntries.sort {$0.score > $1.score}
	}
}
