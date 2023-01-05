//
//  BullseyeAppTests.swift
//  BullseyeAppTests
//
//  Created by gikwegbu on 04/01/2023.
//

import XCTest
@testable import BullseyeApp

class BullseyeAppTests: XCTestCase {
	var game: Game!
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		game = Game()
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		game = nil
	}
	
//	func testExample() throws {
//		XCTAssertEqual(game.points(sliderValue: 50), 20)
//	}
	
	func testScorePositive() throws {
		let guess = game.target + 5
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 95)
	}
	
	func testScoreNegative() throws {
		let guess = game.target - 5
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 95)
	}
	
	
}
