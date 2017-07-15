//
//  WeatherDetailInterfaceMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDetailInterfaceMock: NSObject, WeatherDetailInterface {
    
    private(set) var viewUpdated = false
    private(set) var icon: UIImage? = nil
    
    func updateView() {
        viewUpdated = true
    }
    
    func setIconImage(_ icon: UIImage) {
        self.icon = icon
    }
}
