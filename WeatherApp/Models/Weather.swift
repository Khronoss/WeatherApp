//
//  Weather.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class Weather: NSObject {

    var weatherId: Int
    var shortInfo: String
    var fullInfo: String
    var iconName: String

    init(withJSON json: [String: Any]) {
        weatherId = json["id"] as? Int ?? 0
        shortInfo = json["main"] as? String ?? ""
        fullInfo = json["description"] as? String ?? ""
        iconName = json["icon"] as? String ?? ""
        
        super.init()
    }
}
