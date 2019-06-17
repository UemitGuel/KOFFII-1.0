//
//  LocationBank.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 17.06.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import Foundation

struct LocationBank {
    
    var listCities = [[Location]]()
    var listBarcelona = [Location]()
    var listCologne = [Location]()
    var listMadrid = [Location]()
    
    init() {
        setupBarcelona()
        setupCologne()
        setupMadrid()
        
        setupCities()
    }
    
    mutating func setupCities() {
        listCities.append(self.listBarcelona)
        listCities.append(self.listCologne)
        listCities.append(self.listMadrid)
    }
    
    mutating func setupBarcelona() {
        listBarcelona.append(Location(city: "Barcelona", imageName: "Barcelona",
                         cafes: [Cafe(name: "Itacate", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.379895, longitude: 2.159335, url: "https://www.google.com/maps/place/ITACATE+Juice+Bar+%26+Cafeteria:+A%C3%A7ai,+Kombucha,+Smoothies,+Fresh+Juices+Vegan+Options,+Dog+Friendly/@41.379705,2.156894,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2623d46aac9:0x44d40b773f40d830!8m2!3d41.379701!4d2.159088"),
                                 Cafe(name: "Sopa", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.402390, longitude: 2.195293, url: "https://www.google.com/maps/place/Sopa+Boronat/@41.402362,2.1930992,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a33d245c1451:0x7b7bf33d242ace5a!8m2!3d41.402358!4d2.1952932"),
                                 Cafe(name: "Federal", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food, Features.Cake], latitude: 41.378008, longitude: 2.177775, url: "https://www.google.com/maps/place/Federal+Caf%C3%A9/@41.378008,2.175579,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a256f6edcdd1:0x957c1799400745bc!8m2!3d41.378004!4d2.177773"),
                                 Cafe(name: "Nappuccino", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food], latitude: 41.385280, longitude:  2.161633, url: "https://www.google.com/maps/place/Nappuccino+Caf%C3%A9/@41.385285,2.159441,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a28b9aa3177f:0xd76bd47f9888ec66!8m2!3d41.385281!4d2.161635"),
                                 Cafe(name: "CafeCosmo", image: "Cafe_Itercate", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.387472, longitude: 2.162690, url: "https://www.google.com/maps/place/Caf%C3%A9Cosmo/@41.3874651,2.1604809,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a28cf21a81b7:0x18a13147f245f05b!8m2!3d41.3874611!4d2.1626749"),
                                 Cafe(name: "Satan's Coffee", image: "Cafe_Itercate", features: [Features.Food, Features.Vegan], latitude: 41.382651, longitude: 2.175212, url: "https://www.google.com/maps/place/Satan's+Coffee+Corner/@41.38265,2.173013,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2f8307dbf7d:0x5e2880c1e5eb6e46!8m2!3d41.382646!4d2.175207"),
                                 Cafe(name: "Satan´s Coffee", image: "Cafe_Itercate", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.393602, longitude: 2.174269, url: "https://www.google.com/maps/place/Satan%C2%B4s+Coffee+Co./@41.393601,2.172078,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2ef7c22b1af:0xecdad16457f744c!8m2!3d41.393597!4d2.174272")]))
    }
    
    mutating func setupCologne() {
        listCologne.append(Location(city: "Cologne", imageName: "Cologne", cafes: [Cafe(name: "", image: "", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 0, longitude: 0, url: "")]))
    }
    
    mutating func setupMadrid() {
        listMadrid.append(Location(city: "Madrid", imageName: "Madrid", cafes: [Cafe(name: "", image: "", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 0, longitude: 0, url: "")]))
    }
}
