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
    
    fileprivate var countries = [Country]() {
        didSet {
            countriesFiltered = countries
        }
    }
    fileprivate var countriesFiltered = [Country]()
    fileprivate var searchController: UISearchController?
    
    fileprivate var chosenCountry: Country? = nil
    fileprivate var countriesWhereFlagIsNotPresent = ["AX", "AS", "AI", "AQ", "AW", "BM", "BQ", "BV", "IO", "UM", "VG", "VI", "KY", "CX", "CC", "CW", "FK", "FO", "GF", "PF", "TF", "GI", "GL", "GP", "GU", "GG", "HM", "HK", "IM", "JE", "MO", "MQ", "YT", "MS", "NC", "NF", "MP", "PS", "PN", "PR", "XK", "RE", "BL", "SH", "MF", "PM", "SX", "GS", "SJ", "TK", "TC", "WF"]

    @IBOutlet weak var tableView: UITableView!
    fileprivate let provider = MoyaProvider<CountriesAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.searchController = searchController
        }
        searchController?.delegate = self
        searchController?.searchResultsUpdater = self
        refreshCountriesData()
    }
    
    private func refreshCountriesData() {
        provider.request(.all, completion: {
            data in
            switch data {
            case .success(let response):
                let json = try? JSONSerialization.jsonObject(with: response.data) as! Array<[String: Any]>
                let objects = Mapper<Country>().mapArray(JSONArray: json!)
                self.countries.removeAll()
                objects.forEach { if !self.countriesWhereFlagIsNotPresent.contains($0.alpha2) {self.countries.append($0)}}
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CountryDetailedViewController, chosenCountry != nil {
            controller.country = chosenCountry
        }
    }
}

// MARK: UITableViewDelegate + UITableViewDataSource

extension GeneralCountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.bind(with: countriesFiltered[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesFiltered.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCountry = countriesFiltered[indexPath.row]
        performSegue(withIdentifier: "countryDetailedSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: UISearchResultUpdating

extension GeneralCountriesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        countriesFiltered.removeAll()
        countriesFiltered = countries.filter({$0.name.contains(searchController.searchBar.text ?? "")})
        tableView.contentInset = .zero
        tableView.reloadData()
    }
}

// MARK: UISearchControllerDelegate

extension GeneralCountriesViewController: UISearchControllerDelegate {
    
    func didDismissSearchController(_ searchController: UISearchController) {
        countriesFiltered.removeAll()
        countriesFiltered = countries
        tableView.reloadData()
    }
}
