//
//  ContentView.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        fun_math_time()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct fun_math_time: View {
    
    
    
    var body: some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world :333")
            Text()
        }
        .padding()
    }
}
