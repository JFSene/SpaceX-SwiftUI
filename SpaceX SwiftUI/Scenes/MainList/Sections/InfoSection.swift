//
//  InfoSection.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI

struct InfoSection: View {
	var info: Info
	
    var body: some View {
		ZStack {
			VStack(alignment: .center, spacing: 16) {
				if let data = info {
					InfoText(data: data, font: .headline, fontWeight: .regular, color: .gray, paddingValue: 4)
				}
			}
		}
    }
}
