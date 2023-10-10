//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Michael on 03/10/2023.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPositiveScenarioForAddCalculation() {
        XCTAssert(Calculations.add(5, 5) == 10)
    }

    func testNegativeScenarioForAddCalculation() {
        XCTAssertNil(Calculations.add(nil, nil))
    }
    
    func testPositiveScenarioForSubCalculation() {
        XCTAssert(Calculations.subtract(5, 5) == 0)
    }

    func testNegativeScenarioForSubCalculation() {
        XCTAssertNil(Calculations.subtract(nil, nil))
    }

    func testPositiveScenarioForProdCalculation() {
        XCTAssert(Calculations.multiply(5, 5) == 25)
    }

    func testNegativeScenarioForProdCalculation() {
        XCTAssertNil(Calculations.multiply(nil, nil))
    }
    
    func testPositiveScenarioForDivCalculation() {
        XCTAssert(Calculations.divide(5, 5) == 1)
    }

    func testZeroScenarioForDivCalculation() {
        XCTAssertTrue(Calculations.divide(4, 0)!.isNaN)
    }

    func testPositiveScenarioForSinCalculation() {
        let actual = String(format: "%.2f", Calculations.calculateSin(1)!)
        let expected = "0.84"
        XCTAssert(actual == expected)
    }
}
