//
//  data_info.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/25/23.
//

import Foundation

struct Question: Identifiable {
    let id: UUID
    
    let questionNumber: Int
    
    let input_1: Double
    let input_2: Double
    
    init(questionNumber: Int, input_1: Double, input_2: Double) {
        // Following standard indexing practice, index starts at 0. So, add +1 to parameter "questionNumber" when assigning to "self.questionNumber"
        self.questionNumber = questionNumber + 1
        
        self.input_1 = input_1
        self.input_2 = input_2
        
        self.id = UUID()
    }
    
    func this_is_question_number() -> String {
        let output:String = "Question #\(questionNumber)"
        return output
    }
    
    func product_question() -> String {
        let output: String = "\(input_1.formatted()) x \(input_2.formatted())"
        return output
    }
    
    func product_answer() -> String {
        let result_product: Double = multiplication()
        let output: String = "\(result_product.formatted())"
        return output
    }
    
    
    func sum_question() -> String {
        let output:String = "\(input_1.formatted()) + \(input_2.formatted())"
        return output
    }
    
    func sum_answer() -> String {
        let result_sum: Double = addition()
        let output:String = "\(result_sum.formatted())"
        return output
    }
    
    
    
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

enum math_operation:String, CaseIterable {
    case addition = "Addition"
    case subtraction = "Subtraction"
    case multiplication = "Multiplication"
    case division = "Division"
}
