//
//  Venue.swift
//  ResultTypeDemo
//
//  Created by Jian Ting Li on 7/31/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

//struct Yelp: Codable {
//    let businesses: [Venue]
//
//    struct Venue: Codable {
//        let id: String
//        let alias: String
//        let name: String
//        let image_url: String
//        let coordinates: Coordinates
//
//        struct Coordinates: Codable {
//            let latitude: Double
//            let longitude: Double
//        }
//    }
//}

struct YelpContainer: Codable {
    let businesses: [Venue]
}

struct Venue: Codable {
    let id: String
    let alias: String
    let name: String
    let image_url: String
    let is_closed: Bool
    let url: String
    let rating: Double
    let location: LocationInfo
    let phone: String
    let coordinates: Coordinate
    /**/
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

struct LocationInfo: Codable {
    let address1: String
    let city: String
    let zip_code: String
    let country: String
    let state: String
}






