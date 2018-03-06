//
//  GeneralCountriesViewController.swift
//  TravelAssistant-iOS
//
//  Created by Admin on 07/09/2017.
//  Copyright © 2017 Anton. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class GeneralCountriesViewController: UIViewController {
    
    var countries = [Country]()
    
    var countriesWhereFlagIsNotPresent = ["AX", "AS", "AI", "AQ", "AW", "BM", "BQ", "BV", "IO", "UM", "VG", "VI"]
    
    var searchController: UISearchController?

    @IBOutlet weak var tableView: UITableView!
    let provider = MoyaProvider<CountriesAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
//
//        provider.request(.detailed(name: "belarus")) {
//            data in
//            switch data {
//            case .success(let response):
//                let json = try? JSONSerialization.jsonObject(with: response.data) as! Array<[String: Any]>
//                let objects = Mapper<Country>().mapArray(JSONArray: json!)
//                print(objects)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        provider.request(.all, completion: {
            data in
            switch data {
            case .success(let response):
                let json = try? JSONSerialization.jsonObject(with: response.data) as! Array<[String: Any]>
                let objects = Mapper<Country>().mapArray(JSONArray: json!)
                    self.countries.removeAll()
//                    self.countries = objects
                objects.forEach { if !self.countriesWhereFlagIsNotPresent.contains($0.alpha2) {self.countries.append($0)}}
                    self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
}

extension GeneralCountriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.countryNameLabel.text = countries[indexPath.row].name
        cell.countryCapitalLabel.text = countries[indexPath.row].capital
        cell.bind(with: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
}
