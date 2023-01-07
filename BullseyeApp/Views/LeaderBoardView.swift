//
//  LeaderBoardView.swift
//  BullseyeApp
//
//  Created by gikwegbu on 07/01/2023.
//

import SwiftUI

struct LeaderBoardView: View {
	@Binding var leaderboardIsShowing: Bool
	var body: some View {
		ZStack {
			Color("BackgroundColor")
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 10) {
				HeadView(leaderboardIsShowing: $leaderboardIsShowing)
				LabelView()
				RowView(index: 1, score: 10, date: Date())
			}
		}
	}
}

struct RowView: View {
	let index: Int
	let score: Int
	let date: Date
	var body: some View {
		HStack {
			RoundedTextView(text: String(index))
			Spacer()
			ScoreText(score: score)
				.frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
			Spacer()
			DateText(date: date)
				.frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
		}
		.background(
			RoundedRectangle(cornerRadius: .infinity)
				.strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
		)
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowColWidth)
	}
}

struct HeadView: View {
//https://useyourloaf.com/blog/size-classes
	@Environment(\.verticalSizeClass) var verticalSizeClass
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@Binding var leaderboardIsShowing: Bool
	var body: some View{
		ZStack {
			HStack {
				if verticalSizeClass == .regular &&
					 horizontalSizeClass == .compact {
					 BigBoldText(text: "Leaderboard")
						.padding(.leading)
					Spacer()
				} else {
					BigBoldText(text: "Leaderboard")
				}
			}
			HStack{
				Spacer()
				Button {
					leaderboardIsShowing.toggle()
				} label: {
					RoundedImageViewFilled(systemName: "xmark")
						.padding(.trailing)
				}

			}
		}
	}
}

struct LabelView: View {
	var body: some View{
		HStack {
			Spacer()
				.frame(width: Constants.General.roundedViewLength)
			Spacer()
			LabelText(text: "Score")
				.frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
			Spacer()
			LabelText(text: "Date")
				.frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
		}
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowColWidth)
	}
}

struct LeaderBoardView_Previews: PreviewProvider {
	static private var leaderboardIsShowing = Binding.constant(false)
	static var previews: some View {
		LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing)
		LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing)
			.preferredColorScheme(.dark)
	}
}
