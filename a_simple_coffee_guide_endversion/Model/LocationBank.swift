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
                              Cafe(name: "CafeCosmo", image: "https://images.unsplash.com/photo-1473923377535-0002805f57e8?ixlib=rb-1.2.1&auto=format&fit=crop&w=2069&q=80", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.387472, longitude: 2.162690, url: "https://www.google.com/maps/place/Caf%C3%A9Cosmo/@41.3874651,2.1604809,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a28cf21a81b7:0x18a13147f245f05b!8m2!3d41.3874611!4d2.1626749"),
                              Cafe(name: "Satan's Coffee", image: "https://images.unsplash.com/photo-1458819757519-7581bade511d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1652&q=80", features: [Features.Food, Features.Vegan], latitude: 41.382651, longitude: 2.175212, url: "https://www.google.com/maps/place/Satan's+Coffee+Corner/@41.38265,2.173013,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2f8307dbf7d:0x5e2880c1e5eb6e46!8m2!3d41.382646!4d2.175207"),
                                Cafe(name: "Spice Cafe", image: "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80", features: [Features.Wifi, Features.Food, Features.Cake, Features.Plug], latitude: 41.374226, longitude: 2.163915, url: "https://www.google.es/maps/place/SPICE+CAF%C3%89/@41.3757245,2.1626715,16.07z/data=!4m5!3m4!1s0x12a4a2676e46b431:0x7a5028c3506aee2b!8m2!3d41.3741176!4d2.1638855"),
                                Cafe(name: "Cactus Cafe", image: "https://images.unsplash.com/photo-1522992319-0365e5f11656?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80", features: [Features.Wifi, Features.Cake, Features.Plug], latitude: 41.374395, longitude: 2.163143, url: "https://www.google.es/maps/place/CACTUS+CAF%C3%89/@41.374226,2.1617263,17z/data=!4m5!3m4!1s0x0:0x31f4461640a850d8!8m2!3d41.3743797!4d2.1630896"),
                                Cafe(name: "Cafe Cometa", image: "https://images.unsplash.com/photo-1498709112912-9be3173d30be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.375885, longitude: 2.162021, url: "https://www.google.es/maps/place/Caf%C3%A9+Cometa/@41.3758611,2.1598214,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a266d4e9a089:0x8289088d7711105a!8m2!3d41.3758611!4d2.1620101"),
                                Cafe(name: "Nomad Coffee", image: "https://images.unsplash.com/photo-1512568400610-62da28bc8a13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", features: [], latitude: 41.388952, longitude: 2.177148, url: "https://www.google.es/maps/place/Nomad+Coffee+Lab+%26+Shop/@41.3889442,2.1749597,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2fae7bd7d17:0xaca3bd2eb93f1f15!8m2!3d41.3889442!4d2.1771484"),
                                Cafe(name: "ImaginCafe", image: "https://images.unsplash.com/photo-1475759697283-38cc56e4455a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80", features: [Features.Wifi, Features.Food, Features.Cake, Features.Plug], latitude: 41.385922, longitude: 2.166870, url: "https://www.google.com/maps/place/ImaginCaf%C3%A8/@41.3858903,2.1646433,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0x9fb1e1d64a1cf07e!8m2!3d41.3858903!4d2.166832"),
                                Cafe(name: "Onna Cafe", image: "https://images.unsplash.com/photo-1497636577773-f1231844b336?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80", features: [Features.Wifi, Features.Food, Features.Cake, Features.Plug], latitude: 41.398134, longitude: 2.159660, url: "https://www.google.com/maps/place/Onna+Caf%C3%A8/@41.3981017,2.1574656,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a296825a1675:0x53fee8d307ae2fdb!8m2!3d41.3981017!4d2.1596596"),
                                Cafe(name: "Hidden Cafe", image: "https://images.unsplash.com/photo-1499961524705-bfd103e65a6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake], latitude: 41.388359, longitude: 2.135854, url: "https://www.google.com/maps/place/Hidden+Caf%C3%A9+Barcelona/@41.3883187,2.1336703,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4987b300da145:0x5b31f791ae4eabee!8m2!3d41.3883187!4d2.1358643"),
                                Cafe(name: "Nappuccino", image: "https://images.unsplash.com/photo-1444418776041-9c7e33cc5a9c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80", features: [Features.Wifi, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.385297, longitude: 2.161635, url: "https://www.google.com/maps/place/Nappuccino+Caf%C3%A9/@41.385281,2.159441,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a28b9aa3177f:0xd76bd47f9888ec66!8m2!3d41.385281!4d2.161635"),
                                Cafe(name: "Brooklyn Cafe", image: "https://images.unsplash.com/photo-1503240778100-fd245e17a273?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=1650&q=80", features: [Features.Wifi, Features.Food, Features.Cake], latitude: 41.391766, longitude: 2.146533, url: "https://www.google.com/maps/place/Brooklyn+Caf%C3%A8/@41.391766,2.1459845,19z/data=!4m8!1m2!2m1!1sbrooklyn+coffee!3m4!1s0x0:0xfd71ae6c4093b169!8m2!3d41.3917596!4d2.1465301"),
                                Cafe(name: "La Masala Cafe", image: "https://images.unsplash.com/photo-1480348709911-be15f2c579ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.388423, longitude: 2.177925, url: "https://www.google.com/maps/place/La+Masala+Cafe/@41.3884151,2.1757093,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a2fb0be6e20b:0x1c22ef762dd33051!8m2!3d41.3884151!4d2.1779033"),
                                Cafe(name: "Cafe Orion", image: "https://images.unsplash.com/photo-1512153371649-ebbe07fc197d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.381669, longitude: 2.157515, url: "https://www.google.com/maps/place/Caf%C3%A8+Orion/@41.381669,2.155321,17z/data=!3m1!4b1!4m5!3m4!1s0x12a4a289cd8a7c7b:0x66cd89f83bb7c49e!8m2!3d41.381669!4d2.157515")
                                ]),
             Location(city: "Cologne", imageName: "Cologne", cafes: [
                Cafe(name: "Kaffeesaurus", image: "https://images.unsplash.com/photo-1486482044844-888b371f410c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 50.940394, longitude: 6.938585, url: "https://www.google.com/maps/place/Kaffeesaurus/@50.94036,6.93858,17z/data=!4m12!1m6!3m5!1s0x47bf2510697bb22f:0xeb89da280a86feef!2sKaffeesaurus!8m2!3d50.94036!4d6.93858!3m4!1s0x47bf2510697bb22f:0xeb89da280a86feef!8m2!3d50.94036!4d6.93858"),
                Cafe(name: "hommage Cafe", image: "https://images.unsplash.com/photo-1458819714733-e5ab3d536722?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 50.940610, longitude: 6.941803, url: "https://www.google.com/maps/place/hommage+Caf%C3%A9/@50.94061,6.939609,17z/data=!4m5!3m4!1s0x47bf2507b6360e5f:0x1b96804d5f2e135b!8m2!3d50.940595!4d6.941789"),
                Cafe(name: "WNDRFUEL", image: "https://images.unsplash.com/photo-1501484311399-ed1e8632445d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80", features: [Features.Wifi, Features.Food, Features.Cake, Features.Vegan, Features.Plug], latitude: 50.929567, longitude: 6.937614, url: "https://www.google.com/maps/place/WNDRFUEL/@50.9295119,6.9365851,18.42z/data=!4m5!3m4!1s0x47bf24fe5a0b1bed:0xb46805e9930d5026!8m2!3d50.929547!4d6.937614")
                ]),
             Location(city: "Coming soon", imageName: "Coming_soon", cafes: [
                Cafe(name: "", image: "", features: [], latitude: 0, longitude: 0, url: "")
                ])
            ])
    }
}
