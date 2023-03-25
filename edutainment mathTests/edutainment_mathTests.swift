//
//  edutainment_mathTests.swift
//  edutainment mathTests
//
//  Created by Seika Hirori on 3/17/23.
//

import XCTest
@testable import edutainment_math

final class edutainment_mathTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_multiplication() throws {
        let result_1: Double = 0.0
        let output_1: Double = multiplication(0, 200)
        XCTAssertEqual(output_1, result_1, "Multiplying by 0 should result in 0")
        
        let result_2: Double = 10
        let output_2: Double = multiplication(5, 2)
        XCTAssertEqual(output_2, result_2, "Multiplying 5 by 2 should equal to 10")
        
        let result_3: Double = -20
        let output_3: Double = multiplication(10, -2)
        XCTAssertEqual(output_3, result_3, "Multiplying 10 by -2 should equal to -20; it should be a negative value.")

        
    }

    func test_generate_multiplication_question() throws {
        let expect_input_1:Double = 2
        let expect_input_2:Double = 5
        let expect_product:Double = 10
        
        let expectation_question_1: [String: Double] = [
            "input_1": expect_input_1,
            "input_2": expect_input_2,
            "product": expect_product,
        ]
        let output_1: [String: Double] = generate_multiplication_question(input_1:2, input_2:5)
        
        XCTAssertEqual(expectation_question_1, output_1)
        
        
    }
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
