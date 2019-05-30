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
    var passedlocation : Location = Location(city: "", imageName: "", cafes: [Cafe(name: "", image: "", wifi: 0, food: 0, vegan: 0, cake: 0, plug: 0)], cafesOneString: "")
    var passedCafes = [Cafe]()
    var filteredPassedCafes = [Cafe]()
    var cafenames = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupButtons()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        passedCafes = passedlocation.cafes
    }

    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        title = passedlocation.city
        
        let customFont = UIFont(name: "Staatliches-Regular", size: 40)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
        }
    }
    
    // Buttons
    
    func setupButtons() {
        
        wifiButton.layer.cornerRadius = 0.5 * wifiButton.bounds.size.width
        foodButton.layer.cornerRadius = 0.5 * foodButton.bounds.size.width
        veganButton.layer.cornerRadius = 0.5 * veganButton.bounds.size.width
        cakeButton.layer.cornerRadius = 0.5 * cakeButton.bounds.size.width
        plugButton.layer.cornerRadius = 0.5 * plugButton.bounds.size.width
    }
    
    @IBAction func wifiButtonTapped(_ sender: UIButton) {
        
        if wifiButton.tapped == 0 {
            wifiButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            wifiButton.borderWidth = 2
            wifiLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
            wifiButton.tapped = 1
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        } else {
            wifiButton.customBGColor = UIColor.white
            wifiButton.borderWidth = 1
            wifiLabel.font = UIFont(name: "Quicksand-Medium", size: 17)
            wifiButton.tapped = 0
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func foodButtonTapped(_ sender: UIButton) {
        if foodButton.tapped == 0 {
            foodButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            foodButton.borderWidth = 2
            foodLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
            foodButton.tapped = 1
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        } else {
            foodButton.customBGColor = UIColor.white
            foodButton.borderWidth = 1
            foodLabel.font = UIFont(name: "Quicksand-Medium", size: 17)
            foodButton.tapped = 0
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func veganButtonTapped(_ sender: UIButton) {
        if veganButton.tapped == 0 {
            veganButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            veganButton.borderWidth = 2
            veganLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
            veganButton.tapped = 1
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        } else {
            veganButton.customBGColor = UIColor.white
            veganButton.borderWidth = 1
            veganLabel.font = UIFont(name: "Quicksand-Medium", size: 17)
            veganButton.tapped = 0
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func cakeButtonTapped(_ sender: UIButton) {
        if cakeButton.tapped == 0 {
            cakeButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            cakeButton.borderWidth = 2
            cakeLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
            cakeButton.tapped = 1
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        } else {
            cakeButton.customBGColor = UIColor.white
            cakeButton.borderWidth = 1
            cakeLabel.font = UIFont(name: "Quicksand-Medium", size: 17)
            cakeButton.tapped = 0
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        }
    }
    
    @IBAction func plugButtonTapped(_ sender: UIButton) {
        if plugButton.tapped == 0 {
            plugButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            plugButton.borderWidth = 2
            plugLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
            plugButton.tapped = 1
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        } else {
            plugButton.customBGColor = UIColor.white
            plugButton.borderWidth = 1
            plugLabel.font = UIFont(name: "Quicksand-Medium", size: 17)
            plugButton.tapped = 0
            
            filteredPassedCafes.removeAll()
            cafenames.removeAll()
            filtering()
            tableView.reloadData()
        }
    }
    
    // Search
    
    func isFiltering() -> Bool {
        return wifiButton.tapped != 0 || foodButton.tapped != 0 || veganButton.tapped != 0 || cakeButton.tapped != 0 || plugButton.tapped != 0 
    }

    func filtering() {
        for cafe in passedCafes {
            if wifiButton.tapped == 1 && wifiButton.tapped == cafe.wifi {
                for cafes in filteredPassedCafes {
                    cafenames.append(cafes.name)
                }
                if !cafenames.contains(cafe.name) {
                        filteredPassedCafes.append(cafe)
                    }
                }
            
            if foodButton.tapped == 1 && foodButton.tapped == cafe.food {
                for cafes in filteredPassedCafes {
                    cafenames.append(cafes.name)
                }
                if !cafenames.contains(cafe.name) {
                    filteredPassedCafes.append(cafe)
                }
            }
            
            if veganButton.tapped == 1 && veganButton.tapped == cafe.vegan {
                for cafes in filteredPassedCafes {
                    cafenames.append(cafes.name)
                }
                if !cafenames.contains(cafe.name) {
                    filteredPassedCafes.append(cafe)
                }
            }
            
            if cakeButton.tapped == 1 && cakeButton.tapped == cafe.cake {
                for cafes in filteredPassedCafes {
                    cafenames.append(cafes.name)
                }
                if !cafenames.contains(cafe.name) {
                    filteredPassedCafes.append(cafe)
                }
            }
            
            if plugButton.tapped == 1 && plugButton.tapped == cafe.plug {
                for cafes in filteredPassedCafes {
                    cafenames.append(cafes.name)
                }
                if !cafenames.contains(cafe.name) {
                    filteredPassedCafes.append(cafe)
                }
            }
            
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
        print(filteredPassedCafes)
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
            vc.passedCafe = passedlocation.cafes[indexPath.row]
                    
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.black
            
            let navigationControlleradded = UINavigationController(rootViewController: vc)
            
            navigationControlleradded.navigationItem.backBarButtonItem = backButton
            
            self.present(navigationControlleradded, animated: true, completion: nil)
            //navigationController?.pushViewController(vc, animated: true)

        }
    }
}

