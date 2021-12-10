//
//  Store.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import Combine
import Foundation

class Store: ObservableObject {
	@Published private(set) var companyInfo: Info?
	@Published private(set) var allLaunches = [Launch]()

	func searchAll(query: String) -> ([Launch]) {
	let q = query.lowercased()
	return (
	  allLaunches.filter { $0.mission_name.lowercased().contains(q) }
	)
  }

  // MARK: -

  private var disposables = Set<AnyCancellable>()

  func fetchCompanyInfo() {
	  guard companyInfo == nil else { return }

	NetworkManager.fetch(endpoint: .companyInfo)
	  .sink(receiveCompletion: { print($0) }, receiveValue: { self.companyInfo = $0 })
	  .store(in: &disposables)
  }

  func fetchAllLaunches() {
	guard allLaunches.isEmpty else { return }

	NetworkManager.fetch(endpoint: .allLaunches)
	  .sink(receiveCompletion: { print($0) }, receiveValue: { self.allLaunches = $0 })
	  .store(in: &disposables)
  }
}
