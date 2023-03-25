//
//  data_infoTests.swift
//  edutainment mathTests
//
//  Created by Seika Hirori on 3/25/23.
//

import XCTest
@testable import edutainment_math

final class data_infoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_structQuestion() throws {
        let question_1: Int = 1
        let q1_input_1: Double = 2
        let q1_input_2: Double = 5
        let q1_product: Double = multiplication(q1_input_1, q1_input_2)
        
        let question: Question = Question(number: question_1, input_1: q1_input_1, input_2: q1_input_2)
    }
    
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
