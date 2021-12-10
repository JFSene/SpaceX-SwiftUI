//
//  ReusableHeader.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI


struct ReusableHeader: View {
	let text: String
	
	var body: some View {
		HStack {
			Text(text)
				.padding(.leading, 18)
				.font(.title2)
				.foregroundColor(Color(.white))
			Spacer()
		}
		.background(Color.black)
		.frame(width: UIScreen.main.bounds.size.width, height: 50, alignment: .leading)
	}
}

struct ReusableHeader_Previews: PreviewProvider {
    static var previews: some View {
		ReusableHeader(text: "Company")
    }
}
