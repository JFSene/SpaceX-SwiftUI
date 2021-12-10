//
//  DateFormatter.swift
//  Devskiller
//
//  Created by Joel Sene on 02/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

var dateFormatter: DateFormatter {
  let df = DateFormatter()
  df.dateStyle = .medium
  df.timeStyle = .short
  df.locale = Locale.current

  return df
}
