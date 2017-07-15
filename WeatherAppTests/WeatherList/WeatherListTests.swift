//
//  WeatherListTests.swift
//  WeatherApp
//
//  Created by Anthony Merle on 12/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import XCTest

class WeatherListTests: XCTestCase {
    
    private var mockInterface: WeatherListInterfaceMock!
    private var mockListService: WeatherListServiceMock!
    private var mockIconService: WeatherIconServiceMock!

    private var weatherListPresenter: WeatherListPresenter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockInterface = WeatherListInterfaceMock()
        mockListService = WeatherListServiceMock()
        mockIconService = WeatherIconServiceMock()
        
        weatherListPresenter = WeatherListPresenter(interface: mockInterface, listService: mockListService, iconService: mockIconService)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPresenterLoadingPredictionsShouldCallInterfaceViewUpdate() {
        weatherListPresenter.loadPredictions()
        
        XCTAssertTrue(mockInterface.viewUpdated)
    }

    func testPresenterLoadingPredictionsShouldCallInterfaceSetLoading() {
        weatherListPresenter.loadPredictions()
        
        XCTAssertTrue(mockInterface.isLoadingStart)
    }

    func testPresenterLoadingPredictionsShouldLoadImagesAndCallInterfaceReloadPrediction() {
        mockListService.predictions = createFakePredictions()
        
        weatherListPresenter.loadPredictions()
        
        XCTAssertTrue(mockInterface.loadPredictionCalled)
    }
    
    private func createFakePredictions() -> [Prediction] {
        let dataProvider = PredictionsDataProvider()
        let predictionJson = dataProvider.singleFakePrediction()
        
        let prediction = Prediction(withJSON: predictionJson)
        
        return [prediction]
    }
}
