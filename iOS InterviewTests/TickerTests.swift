//
//  iOS_InterviewTests.swift
//  iOS InterviewTests
//
//  Created by Jonathan Willis on 12/21/17.
//

import XCTest
@testable import iOS_Interview

class TickerTests: XCTestCase {

    var task: URLSessionDataTask?
    static let bundle = Bundle(for: TickerTests.self)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        task?.cancel()
        super.tearDown()
    }
    
    func testGetTickerReturnsDeserializationFailed() {

        class FailingTickerAPIEnvironment: APIEnvironment {
            // INTERVIEW:
            // Complete this mock APIEnvironment that
            // loads the InvalidTicker.json file from the test bundle
            // such that deserialization fails and this test passes
        }

        let environment = FailingTickerAPIEnvironment()

        let expectation = XCTestExpectation(description: "Timed out")

        self.task = Ticker.get(with: environment) { state in
            XCTAssertEqual(state,
                           CoinMarketCapState.failure(CoinMarketCapError.deserializationFailed))
            expectation.fulfill()
        }

        let expectations = [expectation]
        let timeout = environment.getTicker.timeoutInterval
        wait(for: expectations, timeout: timeout)
    }

    func testGetTickerContainsIDBitcoin() {
        // INTERVIEW:
        // Write an assertion that ensures that this test passes if and only if one of the
        // Tickers returned contains an "id" with value "bitcoin"
        // Similar to the above test, this test should succeed even if not connected to the network
        // i.e., you may include a .json file that contains data that makes this test pass
        XCTFail()
    }
}
