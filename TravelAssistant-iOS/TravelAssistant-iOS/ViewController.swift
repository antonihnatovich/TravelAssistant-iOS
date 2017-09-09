//
//  ViewController.swift
//  TravelAssistant-iOS
//
//  Created by Admin on 07/09/2017.
//  Copyright © 2017 Anton. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class ViewController: UIViewController {

    let provider = MoyaProvider<CountriesAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        provider.request(.detailed(name: "belarus")) {
            data in
            switch data {
            case .success(let response):
                let json = try? JSONSerialization.jsonObject(with: response.data) as! Array<[String: Any]>
                let objects = Mapper<Country>().mapArray(JSONArray: json!)
                print(objects)
            case .failure(let error):
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

