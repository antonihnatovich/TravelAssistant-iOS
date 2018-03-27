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
    var alpha2: String!
    var currencies: [Currency]?
    
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
        alpha2      <- map["alpha2Code"]
        currencies  <- map["currencies"]
    }
}

extension Country: Hashable {
    
    var hashValue: Int {
        return (name+alpha2).hashValue
    }
    
    static func == (l: Country, r: Country) -> Bool {
        return l.name.elementsEqual(r.name) && l.alpha2.elementsEqual(r.alpha2)
    }
}
