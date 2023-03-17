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
