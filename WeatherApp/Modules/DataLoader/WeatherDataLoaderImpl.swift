//
//  WeatherDataLoaderImpl.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit
import Alamofire

class WeatherDataLoaderImpl: NSObject, WeatherDataLoader {
    
    private let dailyForecastAPIRoute = "/forecast/daily"
    private let maxPredictionsCount = 16
    private let cityId = 6455259 // Paris
    
    private var apiConfiguration: WeatherAPIConfiguration
    
    init(configuration: WeatherAPIConfiguration) {
        self.apiConfiguration = configuration
        
        super.init()
    }
    
    func getPredictionsFromAPI(_ completion: @escaping ([[String : Any]], NSError?) -> Void) {
        
        let requestPath = createRequestPath()
        let parameters: [String: Any] = [
            "id": cityId,
            "units": apiConfiguration.desiredUnitSystem,
            "cnt": maxPredictionsCount,
            "appid": apiConfiguration.appKey
        ]
        
        Alamofire.request(requestPath, parameters: parameters, encoding: URLEncoding.queryString).responseJSON { (response) in
            guard response.error == nil else {
                completion([], response.error! as NSError)
                return
            }
            
            let json = response.result.value as! [String: Any]
            let predictionsJSON = json["list"] as! [[String: Any]]
            
            completion(predictionsJSON, nil)
        }
    }
    
    private func createRequestPath() -> String {
        return "\(apiConfiguration.fullApiPath())\(dailyForecastAPIRoute)"
    }
}
