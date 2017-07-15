//
//  WeatherDetailPresenterTests.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import XCTest

class WeatherDetailPresenterTests: XCTestCase {
    
    private var mockDetailInterface: WeatherDetailInterfaceMock!
    private var mockIconService: WeatherIconServiceMock!
    private var presenter: WeatherDetailPresenter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDetailInterface = WeatherDetailInterfaceMock()
        mockIconService = WeatherIconServiceMock()
        
        presenter = WeatherDetailPresenter(interface: mockDetailInterface, iconService: mockIconService)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSettingPredictionShouldUpdateViewInterface() {
        let prediction = createFakePrediction()
        
        presenter.setPrediction(prediction)
        
        XCTAssertTrue(mockDetailInterface.viewUpdated)
    }
    
    func testLoadingIconShouldSetIconInterface() {
        let prediction = createFakePrediction()
        let fakeIcon = UIImage(named: "FakeWeatherIcon")
        
        mockIconService.icon = fakeIcon
        presenter.setPrediction(prediction)
        
        presenter.loadPredictionIcon()
        
        XCTAssertNotNil(mockDetailInterface.icon)
    }
    
    private func createFakePrediction() -> Prediction {
        let dataProvider = PredictionsDataProvider()
        let fakeJson = dataProvider.singleFakePrediction()
        
        return Prediction(withJSON: fakeJson)
    }
}
