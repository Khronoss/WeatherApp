//
//  WeatherListServiceTests.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import XCTest

class WeatherListServiceTests: XCTestCase {
    
    private var fakeDataProvider: PredictionsDataProvider!
    private var mockDataLoader: WeatherDataLoaderMock!
    private var weatherListService: WeatherListServiceImpl!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDataLoader = WeatherDataLoaderMock()
        fakeDataProvider = PredictionsDataProvider()
        
        weatherListService = WeatherListServiceImpl(dataLoader: mockDataLoader)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadingPredictionsShouldBeSetInService() {
        let numberOfPredictions = 3
        
        mockDataLoader.predictions = fakeDataProvider.createMultipleFakePredictions(count: numberOfPredictions)

        weatherListService.loadPredictions { (error) in
            let predictions = self.weatherListService.getPredictions()
            
            XCTAssert(predictions.count == numberOfPredictions, "Expected \(numberOfPredictions) but got \(predictions.count)")
        }
    }
}
