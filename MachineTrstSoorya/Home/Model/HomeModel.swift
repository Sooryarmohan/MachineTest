//
//  HomeModel.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import Foundation
struct HomeModel : Codable {
    let status : Bool?
    let homeData : [HomeData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case homeData = "homeData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        homeData = try values.decodeIfPresent([HomeData].self, forKey: .homeData)
    }

}
struct HomeData : Codable {
    let type : String?
    let values : [Values]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case values = "values"
    }

    init(from decoder: Decoder) throws {
        let homevalues = try decoder.container(keyedBy: CodingKeys.self)
        type = try homevalues.decodeIfPresent(String.self, forKey: .type)
        values = try homevalues.decodeIfPresent([Values].self, forKey: .values)
    }

}

struct Values : Codable {
    let id : Int?
    let name : String?
    let image_url : String?
    let banner_url : String?
    let image : String?
    let actual_price : String?
    let offer_price : String?
    let offer : Int?
    let is_express : Bool?


    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case image_url = "image_url"
        case banner_url = "banner_url"
        case image = "image"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        case offer = "offer"
        case is_express = "is_express"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        banner_url = try values.decodeIfPresent(String.self, forKey: .banner_url)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        actual_price = try values.decodeIfPresent(String.self, forKey: .name)
        offer_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer = try values.decodeIfPresent(Int.self, forKey: .offer)
        is_express = try values.decodeIfPresent(Bool.self, forKey: .is_express)
    }

}

