//
//  FilterMenu.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI

class FilterModel {
	var isAsc: Bool = false
	var systemImage: String?
}

struct FilterMenu: View {
	@EnvironmentObject private var store: Store
	@Binding var filtered: [Launch]
	var orderBy = FilterModel()
	
	var body: some View {
		Menu {
			Button("Success", action: successOrder)
			Button("Year of Launch", action: yearOfLaunch)
		} label: {
			Label("Options", systemImage: "magnifyingglass")
		}
	}
	
	
	func yearOfLaunch() {
		self.filtered = []
		let asceFilter = store.allLaunches.sorted { $0.launchYear < $1.launchYear }
		let descFilter = store.allLaunches.sorted { $0.launchYear > $1.launchYear }
		
		if !orderBy.isAsc {
			orderBy.isAsc = true
			self.filtered = asceFilter
		} else {
			orderBy.isAsc = false
			self.filtered = descFilter
		}
	}
	
	func successOrder() {
		self.filtered = []
		
		let asceFilter = store.allLaunches.sorted { !$0.launch_success && $1.launch_success }
		
		let descFilter = store.allLaunches.sorted { $0.launch_success && !$1.launch_success }
		
		if !orderBy.isAsc {
			orderBy.isAsc = true
			self.filtered = asceFilter
		} else {
			orderBy.isAsc = false
			self.filtered = descFilter
		}
	}
}
