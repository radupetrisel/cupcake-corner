//
//  Order.swift
//  CupcakeCorner
//
//  Created by Radu Petrisel on 14.07.2023.
//

import SwiftUI

struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var isAddressValid: Bool {
        name.isNotWhitespace
        && streetAddress.isNotWhitespace
        && city.isNotWhitespace
        && zip.isNotWhitespace
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += Double(type) / 2
        
        // $1 for frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50 for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
