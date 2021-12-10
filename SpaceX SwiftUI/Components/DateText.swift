//
//  DateText.swift
//  SpaceX SwiftUI
//
//  Created by Joel Sene on 09/12/21.
//

import SwiftUI

struct DateText: View {
	let date: Date
	var leading = ""
	var trailing = ""

	var body: some View {
	  Text(leading) + Text(date, style: .relative) + Text(trailing)
	}

}

struct DateText_Previews: PreviewProvider {
    static var previews: some View {
        DateText(date: Date(), trailing: " ago")
    }
}
