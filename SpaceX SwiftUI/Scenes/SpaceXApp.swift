//
//  SpaceXApp.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI

@main
struct SpaceXApp: App {
	@StateObject private var store = Store()
	
	var body: some Scene {
		WindowGroup {
			MainView()
				.environmentObject(store)
		}
	}
}
