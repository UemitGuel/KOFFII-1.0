//
//  CityViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 22.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var wifiButton: RoundButton!
    @IBOutlet weak var wifiLabel: UILabel!
    
    @IBOutlet weak var foodButton: RoundButton!
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var veganButton: RoundButton!
    @IBOutlet weak var veganLabel: UILabel!
    
    @IBOutlet weak var cakeButton: RoundButton!
    @IBOutlet weak var cakeLabel: UILabel!
    
    @IBOutlet weak var plugButton: RoundButton!
    @IBOutlet weak var plugLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // let/var
    var passedlocation : Location = Location(city: "", imageName: "", cafes: [Cafe(name: "", image: "", features: [], latitude: 0, longitude: 0, url: "")])
    var passedCafes = [Cafe]()
    var filteredPassedCafes = [Cafe]()
    var requestedFeatures : [Features] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupButtons()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        passedCafes = passedlocation.cafes
    }

    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        title = passedlocation.city
        
        let customFont = UIFont(name: "Staatliches-Regular", size: 23)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
        }
    }
    
    // Buttons
    
    func setupButtons() {
        
        wifiButton.layer.cornerRadius = 8
        foodButton.layer.cornerRadius = 8
        veganButton.layer.cornerRadius = 8
        cakeButton.layer.cornerRadius = 8
        plugButton.layer.cornerRadius = 8

    }
    
    @IBAction func wifiButtonTapped(_ sender: UIButton) {
        
        if !requestedFeatures.contains(.Wifi) {
            requestedFeatures.append(.Wifi)
            
            wifiButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            wifiButton.borderWidth = 2
            wifiLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
            
            filtering()
            tableView.reloadData()
        } else {
            requestedFeatures = requestedFeatures.filter({ return $0 != .Wifi})
            
            wifiButton.customBGColor = UIColor.white
            wifiButton.borderWidth = 1
            wifiLabel.font = UIFont(name: "Quicksand-Medium", size: 15)
            
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func foodButtonTapped(_ sender: UIButton) {
        if !requestedFeatures.contains(.Food) {
            requestedFeatures.append(.Food)
            
            foodButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            foodButton.borderWidth = 2
            foodLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
            
            filtering()
            tableView.reloadData()
        } else {
            requestedFeatures = requestedFeatures.filter({ return $0 != .Food})

            
            foodButton.customBGColor = UIColor.white
            foodButton.borderWidth = 1
            foodLabel.font = UIFont(name: "Quicksand-Medium", size: 15)
            
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func veganButtonTapped(_ sender: UIButton) {
        if !requestedFeatures.contains(.Vegan) {
            requestedFeatures.append(.Vegan)
            
            veganButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            veganButton.borderWidth = 2
            veganLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
            
            filtering()
            tableView.reloadData()
        } else {
            requestedFeatures = requestedFeatures.filter({ return $0 != .Vegan})

            veganButton.customBGColor = UIColor.white
            veganButton.borderWidth = 1
            veganLabel.font = UIFont(name: "Quicksand-Medium", size: 15)
            
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func cakeButtonTapped(_ sender: UIButton) {
        if !requestedFeatures.contains(.Cake) {
            requestedFeatures.append(.Cake)
            
            cakeButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            cakeButton.borderWidth = 2
            cakeLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
            
            filtering()
            tableView.reloadData()
        } else {
            requestedFeatures = requestedFeatures.filter({ return $0 != .Cake})

            cakeButton.customBGColor = UIColor.white
            cakeButton.borderWidth = 1
            cakeLabel.font = UIFont(name: "Quicksand-Medium", size: 15)
            
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func plugButtonTapped(_ sender: UIButton) {
        if !requestedFeatures.contains(.Plug) {
            requestedFeatures.append(.Plug)
            
            plugButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            plugButton.borderWidth = 2
            plugLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
            
            filtering()
            tableView.reloadData()
        } else {
            requestedFeatures = requestedFeatures.filter({ return $0 != .Plug})

            plugButton.customBGColor = UIColor.white
            plugButton.borderWidth = 1
            plugLabel.font = UIFont(name: "Quicksand-Medium", size: 15)
            
            filtering()
            tableView.reloadData()
        }
    }
    
    // Search
    
    func isFiltering() -> Bool {
        return !requestedFeatures.isEmpty
    }

    func filtering() {
        filteredPassedCafes = passedCafes
        if requestedFeatures.contains(.Wifi) {
            filteredPassedCafes = filteredPassedCafes.filter({return $0.features.contains(.Wifi)})
        }
        if requestedFeatures.contains(.Food) {
            filteredPassedCafes = filteredPassedCafes.filter({return $0.features.contains(.Food)})
        }
        if requestedFeatures.contains(.Vegan) {
            filteredPassedCafes = filteredPassedCafes.filter({return $0.features.contains(.Vegan)})
        }
        if requestedFeatures.contains(.Cake) {
            filteredPassedCafes = filteredPassedCafes.filter({return $0.features.contains(.Cake)})
        }
        if requestedFeatures.contains(.Plug) {
            filteredPassedCafes = filteredPassedCafes.filter({return $0.features.contains(.Plug)})
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavBar()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredPassedCafes.count
        } else {
            return passedlocation.cafes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        cell.selectionStyle = .none
        if isFiltering() {
            cell.cafeImageView.image = UIImage(named: filteredPassedCafes[indexPath.row].image)
            cell.cityCellLabel.text = filteredPassedCafes[indexPath.row].name
            return cell
        } else {
            cell.cafeImageView.image = UIImage(named: passedlocation.cafes[indexPath.row].image)
            cell.cityCellLabel.text = passedlocation.cafes[indexPath.row].name
            return cell
    }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

extension CityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CafeDetailViewController") as? CafeDetailViewController {
            if isFiltering() {
                vc.passedCafe = filteredPassedCafes[indexPath.row]
            } else {
                vc.passedCafe = passedCafes[indexPath.row]
            }
            navigationController?.pushViewController(vc, animated: true)

        }
    }
}
