//
//  WeatherListCacheTests.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import XCTest

class WeatherListCacheTests: XCTestCase {
    
    private var dateFactoryMock: DateFactoryMock!
    private var cache: WeatherListCacheImpl!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        dateFactoryMock = DateFactoryMock()
        cache = WeatherListCacheImpl(defaults: UserDefaults.standard, dateFactory: dateFactoryMock)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    private func createFakeNowDate() -> Date {
        let timestampJanFirst2017: TimeInterval = 1483225200
        return Date(timeIntervalSince1970: timestampJanFirst2017)
    }

    private func createFakeNowDatePlus5Hours() -> Date {
        let timestampJanFirst2017: TimeInterval = 1483243200
        return Date(timeIntervalSince1970: timestampJanFirst2017)
    }

    private func createFakeNowDatePlus1day() -> Date { // actualy fakeNowDate + 26 hours
        let timestampJanFirst2017: TimeInterval = 1483318800
        return Date(timeIntervalSince1970: timestampJanFirst2017)
    }
}
