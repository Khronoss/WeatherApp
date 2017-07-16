//
//  DateFactoryMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 16/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class DateFactoryMock: DateFactory {

    var date = Date()
    
    override func nowDate() -> Date {
        return date
    }
}
