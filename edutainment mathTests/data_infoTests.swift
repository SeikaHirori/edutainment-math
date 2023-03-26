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
        // Assign expected results
        let question_1: Int = 0
        let q1_input_1: Double = 2
        let q1_input_2: Double = 5
        
        let q1_product: Double = q1_input_1 * q1_input_2
        let q1_difference: Double = q1_input_1 - q1_input_2
        let q1_sum: Double = q1_input_1 + q1_input_2
        let q1_quotient: Double = q1_input_1 / q1_input_2
        
        // Create struct for testing
        let q1_output: Question = Question(questionNumber: question_1, input_1: q1_input_1, input_2: q1_input_2)
        
        // Check if question count is correct
        XCTAssertEqual(q1_output.questionNumber, 1)
        
        let statement_question_number_1: String = "Question #1"
        XCTAssertEqual(q1_output.this_is_question_number(), statement_question_number_1)
        
        
        // Check if calcuations are correct
        XCTAssertEqual(q1_output.multiplication(), q1_product)
        XCTAssertEqual(q1_output.subtraction(), q1_difference)
        XCTAssertEqual(q1_output.addition(), q1_sum)
        XCTAssertEqual(q1_output.division(), q1_quotient)
        
        // Check strings for questions and answers
        let question_product1: String = "2 x 5"
        let answer_product1: String = "10"
        XCTAssertEqual(q1_output.product_question(), question_product1)
        XCTAssertEqual(q1_output.product_answer(), answer_product1)
        
        let question_sum1: String = "2 + 5"
        let answer_sum1: String = "7"
        XCTAssertEqual(q1_output.sum_question(), question_sum1)
        XCTAssertEqual(q1_output.sum_answer(), answer_sum1)
        
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
