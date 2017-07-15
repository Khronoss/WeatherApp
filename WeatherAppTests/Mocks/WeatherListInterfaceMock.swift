//
//  WeatherListInterfaceMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListInterfaceMock: NSObject, WeatherListInterface {
    var viewUpdated = false
    
    var isLoadingStart = false
    var isLoadingEnd = false
    
    var errorPresented = false
    
    var loadPredictionCalled = false
    
    func updateView() {
        viewUpdated = true
    }
    
    func setLoading(_ isLoading: Bool) {
        if isLoading {
            isLoadingStart = true
        } else {
            isLoadingEnd = true
        }
    }
    
    func presentError(_ error: NSError) {
        errorPresented = true
    }
    
    func reloadPrediction(atIndex index: Int) {
        loadPredictionCalled = true
    }
}
