//
//  LaunchDetailsView.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI
import Kingfisher

struct LaunchDetailsView: View {
	let launch: Launch
	
	var body: some View {
		List {
			// Patch
			if let patch = launch.links?.mission_patch {
				Section(header: HStack {
					Spacer()
					let url = URL(string: patch)
					KFImage(url)
						.placeholder { ProgressView() }
						.resizable()
						.frame(width: 270, height: 270)
						.shadow(color: .secondary, radius: 5)
						.padding()
						.padding(.top)
					Spacer()
				}) {}
			}
			// Links
			Section(header: Text("Links")) {
				if let wikipediaURL = URL(string: launch.links?.wikipedia ?? ""),
				   let youtubeURL = URL(string: launch.links?.video_link ?? ""),
				   let articleURL = URL(string: launch.links?.article_link ?? "") {
					Link("Wikipedia", destination: wikipediaURL)
						.foregroundColor(.accentColor)
					Link("YouTube", destination: youtubeURL)
						.foregroundColor(.accentColor)
					Link("Article", destination: articleURL)
						.foregroundColor(.accentColor)
				} else {
					Text("None")
				}
			}
		}
		.navigationTitle(launch.mission_name)
		.navigationBarTitleDisplayMode(.inline)
	}
}


