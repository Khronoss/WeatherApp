//
//  Temperature.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class Temperature: NSObject {

    var day: Float
    var min: Float
    var max: Float
    var night: Float
    var evening: Float
    var morning: Float

    init(withJSON json: [String: Any]) {
        day = json["day"] as? Float ?? 0
        min = json["min"] as? Float ?? 0
        max = json["max"] as? Float ?? 0
        night = json["night"] as? Float ?? 0
        evening = json["eve"] as? Float ?? 0
        morning = json["morn"] as? Float ?? 0
        
        super.init()
    }
}
