//
//  CountriesAPI.swift
//  TravelAssistant-iOS
//
//  Created by Anton on 9/9/17.
//  Copyright © 2017 Anton. All rights reserved.
//

import Foundation
import Moya

enum CountriesAPI {
    case all
    case inRegion(region: String)
    case detailed(name: String)
}

extension CountriesAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://restcountries.eu/rest/v2")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/all"
        case .inRegion(let region):
            return "/region/\(region.lowercased())"
        case .detailed(let name):
            return "/name/\(name)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .all,
            .detailed,
            .inRegion:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .detailed:
            var parameters = [String: Any]()
            parameters["fullText"] = "true"
            return parameters
        case .all,
            .inRegion:
            return nil
        }
    }
    
    var task: Task {
        switch self {
        case .all,
             .detailed,
             .inRegion:
            return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return nil
    }
}
