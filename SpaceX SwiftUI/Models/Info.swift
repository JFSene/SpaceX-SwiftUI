//
//  Info.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import Foundation
import Combine

// MARK: - Info
class Info: Codable, Identifiable {
	var name: String
	var founder: String
	var founded: Int
	var employees: Int
	var vehicles: Int
	var launch_sites: Int
	var test_sites: Int
	var ceo: String
	var cto: String
	var coo: String
	var cto_propulsion: String
	var valuation: Int
	var summary: String

	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
		self.founder = try container.decodeIfPresent(String.self, forKey: .founder) ?? ""
		self.founded = try container.decodeIfPresent(Int.self, forKey: .founded) ?? 0
		self.employees = try container.decodeIfPresent(Int.self, forKey: .employees) ?? 0
		self.vehicles = try container.decodeIfPresent(Int.self, forKey: .vehicles) ?? 0
		self.launch_sites = try container.decodeIfPresent(Int.self, forKey: .launch_sites) ?? 0
		self.test_sites = try container.decodeIfPresent(Int.self, forKey: .test_sites) ?? 0
		self.ceo = try container.decodeIfPresent(String.self, forKey: .ceo) ?? ""
		self.cto = try container.decodeIfPresent(String.self, forKey: .cto) ?? ""
		self.coo = try container.decodeIfPresent(String.self, forKey: .coo) ?? ""
		self.cto_propulsion = try container.decodeIfPresent(String.self, forKey: .cto_propulsion) ?? ""
		self.valuation = try container.decodeIfPresent(Int.self, forKey: .valuation) ?? 0
		self.summary = try container.decodeIfPresent(String.self, forKey: .summary) ?? ""
	}
}
