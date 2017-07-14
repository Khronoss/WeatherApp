//
//  WeatherListTests.swift
//  WeatherApp
//
//  Created by Anthony Merle on 12/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import XCTest

class WeatherListTests: XCTestCase {
    
    private var mockWeatherService: WeatherListServiceMock!
    private var mockInterface: WeatherListInterfaceMock!

    private var weatherListPresenter: WeatherListPresenter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockWeatherService = WeatherListServiceMock()
        mockInterface = WeatherListInterfaceMock()
        
        weatherListPresenter = WeatherListPresenter(interface: mockInterface, weatherService: mockWeatherService)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPresenterLoadingPredictionsShouldCallInterfaceViewUpdate() {
        weatherListPresenter.loadPredictions()
        
        XCTAssert(mockInterface.viewUpdated == true)
    }
}
