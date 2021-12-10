//
//  MainView.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI

struct MainView: View {
	@EnvironmentObject private var store: Store
	@State var filtered = [Launch]()
	
	var body: some View {
		ZStack {
			NavigationView {
				List {
					if let info = store.companyInfo,
					   let launches = store.allLaunches {
						Section {
							InfoSection(info: info)
						} header: {
							ReusableHeader(text: "Company")
						}
						Section {
							LaunchSection(filtered: $filtered, launches: launches.sorted{ $0.launchYear > $1.launchYear})
						} header: {
							ReusableHeader(text: "Launches")
						}
						
					} else {
						LoadingView()
							.onAppear { store.fetchCompanyInfo() }
							.onAppear { store.fetchAllLaunches() }
					}
				}
				.navigationTitle("SpaceX")
				.buttonStyle(PlainButtonStyle())
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						FilterMenu(filtered: $filtered)
					}
				}
			}
		}
	}
	
	
	
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
