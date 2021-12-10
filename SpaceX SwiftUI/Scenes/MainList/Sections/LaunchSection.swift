//
//  LaunchSection.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI

struct LaunchSection: View {
	@Binding var filtered: [Launch]
	var launches = [Launch]()
	
    var body: some View {
		if filtered.isEmpty {
			ForEach(launches) { launch in
				LaunchSectionCell(launch: launch)
			}
		} else {
			ForEach(filtered) { launch in
				LaunchSectionCell(launch: launch)
		 }
		}
    }
}
