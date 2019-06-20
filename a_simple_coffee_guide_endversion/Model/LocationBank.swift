//
//  LocationBank.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 18.06.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import Foundation

struct LocationBank {
    
    var listCities = [Location]()
    
    init() {
        setupListCities()
    }
    
    mutating func setupListCities() {
        listCities.append(contentsOf:
            [Location(city: "Barcelona", imageName: "Barcelona",
                      cafes: [Cafe(name: "Itacate", image: "https://images.unsplash.com/photo-1458819714733-e5ab3d536722?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.379895, longitude: 2.159335, url: "https://www.google.com/maps/place/ITACATE+Juice+Bar+%26+Cafeteria:+A%C3%A7ai,+Kombucha,+Smoothies,+Fresh+Juices+Vegan+Options,+Dog+Friendly/@41.379705,2.156894,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2623d46aac9:0x44d40b773f40d830!8m2!3d41.379701!4d2.159088"),
                              Cafe(name: "Sopa", image: "https://images.unsplash.com/photo-1501484311399-ed1e8632445d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.402390, longitude: 2.195293, url: "https://www.google.com/maps/place/Sopa+Boronat/@41.402362,2.1930992,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a33d245c1451:0x7b7bf33d242ace5a!8m2!3d41.402358!4d2.1952932"),
                              Cafe(name: "Federal", image: "https://images.unsplash.com/photo-1446321423766-c339f030bd0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80", features: [Features.Wifi, Features.Food, Features.Cake], latitude: 41.378008, longitude: 2.177775, url: "https://www.google.com/maps/place/Federal+Caf%C3%A9/@41.378008,2.175579,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a256f6edcdd1:0x957c1799400745bc!8m2!3d41.378004!4d2.177773"),
                              Cafe(name: "Nappuccino", image: "https://images.unsplash.com/photo-1455813870877-04a32045af63?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=993&q=80", features: [Features.Wifi, Features.Food], latitude: 41.385280, longitude:  2.161633, url: "https://www.google.com/maps/place/Nappuccino+Caf%C3%A9/@41.385285,2.159441,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a28b9aa3177f:0xd76bd47f9888ec66!8m2!3d41.385281!4d2.161635"),
                              Cafe(name: "CafeCosmo", image: "https://images.unsplash.com/photo-1473923377535-0002805f57e8?ixlib=rb-1.2.1&auto=format&fit=crop&w=2069&q=80", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.387472, longitude: 2.162690, url: "https://www.google.com/maps/place/Caf%C3%A9Cosmo/@41.3874651,2.1604809,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a28cf21a81b7:0x18a13147f245f05b!8m2!3d41.3874611!4d2.1626749"),
                              Cafe(name: "Satan's Coffee", image: "https://images.unsplash.com/photo-1458819757519-7581bade511d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1652&q=80", features: [Features.Food, Features.Vegan], latitude: 41.382651, longitude: 2.175212, url: "https://www.google.com/maps/place/Satan's+Coffee+Corner/@41.38265,2.173013,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2f8307dbf7d:0x5e2880c1e5eb6e46!8m2!3d41.382646!4d2.175207")]),
             Location(city: "Cologne", imageName: "Cologne", cafes: [Cafe(name: "", image: "", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 0, longitude: 0, url: "")]),
             Location(city: "Madrid", imageName: "Madrid", cafes: [Cafe(name: "", image: "", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 0, longitude: 0, url: "")])])
        
    }
}
