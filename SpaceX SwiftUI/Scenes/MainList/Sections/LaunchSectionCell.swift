//
//  LaunchSectionCell.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import Kingfisher
import SwiftUI

struct LaunchSectionCell: View {
	let launch: Launch
	
	var body: some View {
		NavigationLink(destination: LaunchDetailsView(launch: launch)) {
			ZStack {
				HStack {
					// Patch
					if let patch = launch.links?.mission_patch_small {
						let url = URL(string: patch)
						KFImage(url)
							.resizable()
							.frame(width: 30, height: 30)
					} else {
						Image(systemName: "paperplane")
							.frame(width: 30, height: 30)
					}
					// Text
					VStack(alignment: .leading) {
						Text("Mission: " + launch.mission_name)
						Text(launch.date, formatter: dateFormatter)
							.font(.subheadline)
							.foregroundColor(.secondary)
						if let rName = launch.rocket?.rocket_name,
						   let rType = launch.rocket?.rocket_type {
							
							Text("Rocket: \(rName) / \(rType)")
								.font(.subheadline)
								.foregroundColor(.secondary)
						}
						if launch.date.timeIntervalSince(Date()).sign == FloatingPointSign.minus {
						  DateText(date: launch.date, leading: "Since ")
						} else {
							DateText(date: launch.date, trailing: " From")
						}
					}
					ZStack(alignment: .topTrailing) {
						switch launch.launch_success {
						case true:
							Image(systemName: "checkmark")
								.frame(width: 10, height: 10)
								.foregroundColor(Color.green)
						default:
							Image(systemName: "xmark")
								.frame(width: 10, height: 10)
								.foregroundColor(Color.red)
						}
					}
				}
			}.padding(.vertical, 8)
		}
	}
}
