//
//  WeatherDataLoaderImpl.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class WeatherDataLoaderImpl: NSObject, WeatherDataLoader {
    
    private let dailyForecastAPIRoute = "/forecast/daily"
    private let maxPredictionsCount = 16
    private let cityId = 6455259 // Paris
    
    private let iconAPIRoute = "/img/w"
    private let iconExtension = "png"
    
    private var apiConfiguration: WeatherAPIConfiguration
    
    init(configuration: WeatherAPIConfiguration) {
        self.apiConfiguration = configuration
        
        super.init()
    }
    
    func getPredictionsFromAPI(_ completion: @escaping ([[String : Any]], NSError?) -> Void) {
        
        let requestPath = createPredictionsListRequestPath()
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
    
    private func createPredictionsListRequestPath() -> String {
        return "\(apiConfiguration.fullApiPath())\(dailyForecastAPIRoute)"
    }
    
    func getIconFromAPI(withName name: String, completion: @escaping (UIImage?, NSError?) -> Void) {
        let requestPath = createIconRequestPath(withName: name)
        
        Alamofire.request(requestPath).responseImage { (response) in
            guard response.error == nil else {
                completion(nil, response.error! as NSError)
                return
            }
            
            completion(response.result.value!, nil)
        }
    }
    
    private func createIconRequestPath(withName name: String) -> String {
        return "\(apiConfiguration.hostName)\(iconAPIRoute)/\(name).\(iconExtension)"
    }
}
