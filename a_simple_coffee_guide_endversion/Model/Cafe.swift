//
//  Cafe.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 23.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import Foundation

enum Features {
    case Wifi
    case Food
    case Vegan
    case Cake
    case Plug
}

struct Cafe {
    let name: String
    let image: String
    let features: [Features]
    let latitude: Double
    let longitude: Double
    let url: String
}


