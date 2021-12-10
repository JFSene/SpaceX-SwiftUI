//
//  Launch.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import Foundation
import Combine

class Launch: Codable, Identifiable {
	var mission_name: String
	var launchDateLocal: String
	var launch_date_unix: TimeInterval
	var rocket: Rocket?
	var links: Links?
	var launch_success: Bool
	var launch_year: String
	
	var date: Date {
	  Date(timeIntervalSince1970: launch_date_unix)
	}
	
	var launchYear: Int {
		Int(launch_year) ?? 0
	}
	
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.mission_name = try container.decodeIfPresent(String.self, forKey: .mission_name) ?? ""
		self.launchDateLocal = try container.decodeIfPresent(String.self, forKey: .launchDateLocal) ?? ""
		self.rocket = try container.decode(Rocket.self, forKey: .rocket)
		self.links = try container.decode(Links.self, forKey: .links)
		self.launch_success = try container.decodeIfPresent(Bool.self, forKey: .launch_success) ?? false
		self.launch_date_unix = try container.decodeIfPresent(TimeInterval.self, forKey: .launch_date_unix) ?? 0.0
		self.launch_year = try container.decodeIfPresent(String.self, forKey: .launch_year) ?? ""
	}
}
// MARK: - Rocket
class Rocket: Codable, Identifiable {
	var rocket_name: String
	var rocket_type: String
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.rocket_name = try container.decodeIfPresent(String.self, forKey: .rocket_name) ?? ""
		self.rocket_type = try container.decodeIfPresent(String.self, forKey: .rocket_type) ?? ""
	}
	
}

class Links: Codable, Identifiable {
	var video_link: String?
	var wikipedia: String?
	var mission_patch_small: String?
	var mission_patch: String?
	var article_link: String?
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.video_link = try container.decodeIfPresent(String.self, forKey: .video_link) ?? ""
		self.wikipedia = try container.decodeIfPresent(String.self, forKey: .wikipedia) ?? ""
		self.mission_patch_small = try container.decodeIfPresent(String.self, forKey: .mission_patch_small) ?? ""
		self.mission_patch = try container.decodeIfPresent(String.self, forKey: .mission_patch) ?? ""
		self.article_link = try container.decodeIfPresent(String.self, forKey: .article_link) ?? ""
	}
}
