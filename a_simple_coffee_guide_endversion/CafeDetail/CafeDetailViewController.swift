//
//  CafeDetailViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 01.06.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class CafeDetailViewController: UIViewController {

    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var toLocationButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
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
    
    
    
    // let/var
    var passedCafe = Cafe(name: "", image: "", features: [], latitude: 0, longitude: 0, url: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        activateButtons(passedCafe)
        
        nameLabel.text = passedCafe.name
        
        // set map
        let location = CLLocation(latitude: passedCafe.latitude, longitude: passedCafe.longitude)
        centerMapOnLocation(location: location)

    }
    
    func setupButtons() {
        
        wifiButton.layer.cornerRadius = 8
        foodButton.layer.cornerRadius = 8
        veganButton.layer.cornerRadius = 8
        cakeButton.layer.cornerRadius = 8
        plugButton.layer.cornerRadius = 8
        
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func activateButtons(_ passedCafe: Cafe) {
        if passedCafe.features.contains(.Wifi) {
            wifiButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            wifiButton.borderWidth = 2
            wifiLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
        }
        if passedCafe.features.contains(.Food) {
            foodButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            foodButton.borderWidth = 2
            foodLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
        }
        if passedCafe.features.contains(.Vegan) {
            veganButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            veganButton.borderWidth = 2
            veganLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
        }
        if passedCafe.features.contains(.Cake) {
            cakeButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            cakeButton.borderWidth = 2
            cakeLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
        }
        if passedCafe.features.contains(.Plug) {
            plugButton.customBGColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            plugButton.borderWidth = 2
            plugLabel.font = UIFont(name: "Quicksand-Bold", size: 15)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toLocationButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "", message: "Choose your Map App", preferredStyle: .actionSheet)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        //Google Maps
        let actionGoogleMaps = UIAlertAction(title: "Google Maps", style: .default) { UIAlertAction in
            
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps-x-callback://")!)) {
                
                UIApplication.shared.open((URL(string: self.passedCafe.url)!) , options: [:] , completionHandler: nil)
            } else {
                print("Can't use comgooglemaps://");
            }
        }
        
        //Apple Maps
        let actionAppleMaps = UIAlertAction(title: "Apple Maps", style: .default) { UIAlertAction in
            let url = URL(string: "http://maps.apple.com/?q=\(self.passedCafe.name)&sll=\(self.passedCafe.latitude),\(self.passedCafe.longitude)&t=s")
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)

            }
        
        alert.addAction(actionGoogleMaps)
        alert.addAction(actionAppleMaps)
        alert.addAction(actionCancel)
        
        present(alert, animated: true)
        
}
}
