//
//  StringExtensions.swift
//  CupcakeCorner
//
//  Created by Radu Petrisel on 14.07.2023.
//

import Foundation

extension String {
    var isNotWhitespace: Bool {
        !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
