//
//  WordingLocalization.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WordingLocalization: NSObject {
    
    private var stringFileName = "Localizable"
    
    func localized(_ string: String, withVariables args: [String: String] = [:]) -> String {
        
        var localizedString = NSLocalizedString(string, tableName: stringFileName, comment: "")

        for (key, value) in args {
            localizedString = localizedString.replacingOccurrences(of: key, with: value)
        }
        
        return localizedString
    }
    
}
