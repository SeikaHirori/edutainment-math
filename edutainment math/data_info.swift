//
//  data_info.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/25/23.
//

import Foundation

struct Question {
    let questionNumber: Int
    
    let input_1: Double
    let input_2: Double
    
    let product: Double
    
    let sum: Double
    let difference: Double
    let quotient: Double
    
    
    init(questionNumber: Int, input_1: Double, input_2: Double) {
        self.questionNumber = questionNumber
        self.input_1 = input_1
        self.input_2 = input_2
        
        self.product = multiplication(input_1, input_2)
        
        self.sum = addition(input_1, input_2)
        self.difference = subtraction(input_1, input_2)
        self.quotient = division(input_1, input_2)
    }

}


func multiplication(_ input1: Double, _ input2: Double) -> Double {
    var output:Double
    
    output = input1 * input2
    
    return output
}

func addition(_ input1: Double, _ input2: Double) -> Double {
    var output:Double
    
    output = input1 + input2
    
    return output
}

func subtraction(_ input1: Double, _ input2: Double) -> Double {
    var output: Double
    
    output = input1 - input2
    
    return output
}

func division(_ input1: Double, _ input2: Double) -> Double {
    var output: Double
    
    output = input1 / input2
    
    return output
}
