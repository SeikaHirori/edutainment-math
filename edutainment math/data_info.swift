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
    
    func multiplication() -> Double {
        var output:Double
        
        output = input_1 * input_2
        
        return output
    }
    
    func addition() -> Double {
        var output:Double
        
        output = input_1 + input_2
        
        return output
    }
    
    func subtraction() -> Double {
        var output: Double
        
        output = input_1 - input_2
        
        return output
    }
    
    func division() -> Double {
        var output: Double
        
        output = input_1 / input_2
        
        return output
    }
    
}
