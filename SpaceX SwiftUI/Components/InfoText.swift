//
//  InfoText.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//


import SwiftUI

struct InfoText: View {
	var data: Info
	var font: Font?
	var fontWeight: Font.Weight?
	var color: Color?
	var paddingValue: CGFloat?
	
	var body: some View {
		HStack {
			Text("\(data.name) was founded by \(data.founder) in \(String(describing: data.founded)). It has now \(data.employees) employees, \(data.launch_sites) launch sites, and is valued in USD \(data.valuation)")
				.font(font)
				.foregroundColor(color)
				.fontWeight(fontWeight)
		}
		.padding(.bottom, paddingValue)
		.onAppear {
			print(data.founded)
		}
	}
}
