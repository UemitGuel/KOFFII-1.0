//
//  LocationViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 22.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var DE_BarButtonItem: UIBarButtonItem!
    
    // let/var
    let searchController = UISearchController(searchResultsController: nil)
    var locations = [Location]()
    var filteredLocations = [Location]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupSearchBar()
       
        tableView.delegate = self
        tableView.dataSource = self
        populateTableView()
        
        
        

    }
    
    func setupNavBar() {
    // eliminate 1pt line
    self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    // Search
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search.."
        navigationItem.searchController = searchController
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.tintColor = .black
        definesPresentationContext = true
        
        self.searchController.searchBar.setValue("X", forKey: "cancelButtonText")

    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredLocations = locations.filter({( location : Location) -> Bool in
            return location.cafesOneString.lowercased().contains(searchText.lowercased()) || location.city.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // Filling the Data
    
    func populateTableView() {
        locations = [
            Location(city: "Barcelona", imageName: "Barcelona",
                     cafes: [Cafe(name: "Itacate", image: "Cafe_Itercate", wifi: 1, food: 1, vegan: 1, cake: 1, plug: 1),
                             Cafe(name: "Sopa", image: "Cafe_Itercate", wifi: 1, food: 1, vegan: 1, cake: 1, plug: 1),
                             Cafe(name: "Federal", image: "Cafe_Itercate", wifi: 1, food: 1, vegan: 0, cake: 0, plug: 0), //please check
                            Cafe(name: "Nappuccino", image: "Cafe_Itercate", wifi: 1, food: 0, vegan: 0, cake: 1, plug: 1), // please check
                            Cafe(name: "CafeCosmo", image: "Cafe_Itercate", wifi: 0, food: 1, vegan: 1, cake: 1, plug: 0),
                            Cafe(name: "Satan's Coffee - Gòtic", image: "Cafe_Itercate", wifi: 0, food: 1, vegan: 1, cake: 1, plug: 0),
                            Cafe(name: "Satan´s Coffee - Eixample", image: "Cafe_Itercate", wifi: 0, food: 1, vegan: 1, cake: 1, plug: 0)], cafesOneString: ""),
            Location(city: "Cologne", imageName: "Cologne", cafes: [Cafe(name: "", image: "", wifi: 0, food: 0, vegan: 0, cake: 0, plug: 0)], cafesOneString: ""),
            Location(city: "Madrid", imageName: "Madrid", cafes: [Cafe(name: "", image: "", wifi: 0, food: 0, vegan: 0, cake: 0, plug: 0)], cafesOneString: "")
        ]
    }
    
    
    
    @IBAction func DE_BarButtonItemTapped(_ sender: UIBarButtonItem) {
        
    }
    
}

extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell
        cell.selectionStyle = .none

        let location : Location
        
        if isFiltering() {
            location = filteredLocations[indexPath.row]
        } else {
            location = locations[indexPath.row]
        }
        cell.cellLabel.text = location.city
        cell.locationImageView.image = UIImage(named: location.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension LocationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController {
            let location : Location
            if isFiltering() {
                location = filteredLocations[indexPath.row]
                vc.passedlocation = location
            } else {
                location = locations[indexPath.row]
                vc.passedlocation = location
            }
            parent?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension LocationViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
}

