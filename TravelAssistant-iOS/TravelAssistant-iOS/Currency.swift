//
//  Currency.swift
//  TravelAssistant-iOS
//
//  Created by Anton Ihnatovich on 3/27/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import ObjectMapper

class Currency: Mappable {
    
    var name: String!
    var code: String!
    var symbol: String!

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
        code    <- map["code"]
        symbol  <- map["symbol"]
    }
}
