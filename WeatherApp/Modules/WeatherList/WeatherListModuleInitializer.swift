//
//  WeatherListModuleInitializer.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListModuleInitializer: NSObject {

    func initialize(controller aController: UIViewController) -> Void {
        guard let controller = aController as? WeatherListViewController else {
            return
        }
        
        let listService = createWeatherListService()
        let iconService = createWeatherIconService()
        let localizator = WordingLocalization()
        
        let presenter = WeatherListPresenter(interface: controller, listService: listService, iconService: iconService)
        
        let detailInitializer = createDetailInitializer()
        presenter.setDetailInitializer(detailInitializer)

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
    
    private func createDetailInitializer() -> WeatherDetailModuleInitializer {
        let initializer = WeatherDetailModuleInitializerImpl()
        
        return initializer
    }
}
