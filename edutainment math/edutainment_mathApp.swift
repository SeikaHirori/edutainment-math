//
//  edutainment_mathApp.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/17/23.
//

import SwiftUI

@main
struct edutainment_mathApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func multiplication(_ input_1:Double, _ input_2:Double) -> Double {
    var output:Double
    
    output = input_1 * input_2
    
    return output
}

func generate_multiplication_question(input_1: Double, input_2: Double) -> [String: Double] {
    var output: [String: Double] = [String:Double]()
    output["input_1"] = input_1
    output["input_2"] = input_2
    
    output["product"] = multiplication(input_1, input_2)
    
    
    return output
}

func set_of_questions(_ amount: Int) -> [Dictionary<String, Double>] {
    var output: [Dictionary<String, Double>] = []
    
    
    
    return output
}
