//
//  Country.swift
//  TravelAssistant-iOS
//
//  Created by Anton on 9/9/17.
//  Copyright © 2017 Anton. All rights reserved.
//

import Foundation
import ObjectMapper

struct Country: Mappable {
    
    var name: String!
    var capital: String!
    var region: String!
    var subRegion: String!
    var population: Int!
    var denonym: String!
    var area: Double!
    var timezone: String!
    var flag: String!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        name        <- map["name"]
        capital     <- map["capital"]
        region      <- map["region"]
        subRegion   <- map["subregion"]
        population  <- map["population"]
        denonym     <- map["denonym"]
        area        <- map["area"]
        timezone    <- map["timezone"]
        flag        <- map["flag"]
    }
}
