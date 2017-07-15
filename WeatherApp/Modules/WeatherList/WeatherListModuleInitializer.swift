//
//  WeatherListModuleInitializer.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListModuleInitializer: NSObject {

    func initialize(controller: WeatherListViewController) -> Void {
        
        let listService = createWeatherListService()
        let iconService = createWeatherIconService()
        let localizator = WordingLocalization()
        
        let presenter = WeatherListPresenter(interface: controller, listService: listService, iconService: iconService)

        controller.presenter = presenter
        controller.localizator = localizator
    }
    
    private func createWeatherListService() -> WeatherListService {
        let dataLoader = createDataLoader()
        let service = WeatherListServiceImpl(dataLoader: dataLoader)

        return service
    }

    private func createDataLoader() -> WeatherDataLoader {
        let dataLoaderConfig = WeatherAPIConfiguration()
        let dataLoader = WeatherDataLoaderImpl(configuration: dataLoaderConfig)
        
        return dataLoader
    }
    
    private func createWeatherIconService() -> WeatherIconService {
        let dataLoader = createDataLoader()
        let service = WeatherIconServiceImpl(dataLoader: dataLoader)
        
        return service
    }
}
