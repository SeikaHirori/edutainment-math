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
    
    let selectable_amount: [Int] = [5, 10, 20]
    @State private var amount_of_questions: Int = 5
    @State private var question_set: [Question] = [Question(questionNumber: 0, input_1: 2, input_2: 5)]
    
    @State private var current_question_count: Int = 0
    @State private var correct_answers: Int = 0
    
    @State private var least_range: Double = 2
    @State private var greatest_range: Double = 12
    
    @State private var settings_mode: Bool = false
    
    
    
    var body: some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Math time :333")
            
            List {
                Section("Muiltiplication Table") {
                    Stepper("Least: \(least_range.formatted())", value: $least_range, in: 2...12
                    )
                    
                    Stepper("Greatest: \(greatest_range.formatted())", value: $greatest_range, in:2...12
                    )
                }
                
                Section("Select amount of questions") {
                    Picker("How many questions?", selection: $amount_of_questions) {
                        ForEach(selectable_amount, id: \.self) { num in
                            Text(String(num))
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section("Debugging"){
                    // Debugging purposes
                    VStack {
                        Text("Select amount of questions: \(amount_of_questions)")
                        Text("Question #\(current_question_count + 1)")
                        Text("Correct Answers: \(correct_answers)")
                        
                        Text("Is it settings mode state: \(String(settings_mode))")
                    }
                    .padding()
                    
                }
                
                Section("Questions") {
                    ForEach(question_set) { question in
                        Text(question.question_product())
                    }
                }
            }
        }
        .padding()
        .onAppear(perform: create_set_questions)
    }
    
    func new_game_state() -> () {
        create_set_questions()
    }
    
    func create_set_questions() -> () {
        var create_set_questions: [Question] = []
        
        var index:Int = 0
        while index < amount_of_questions {
            let input_1: Double = Double(Int.random(in: Int(least_range)...Int(greatest_range)))
            let input_2: Double = Double(Int.random(in: Int(least_range)...Int(greatest_range)))
            
            let new_question:Question = Question(questionNumber: index, input_1: input_1, input_2: input_2)
            
            create_set_questions.append(new_question)
            
            index += 1
        }
        
        question_set = create_set_questions
    }
}

extension Binding {
    
    // RFER #1
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                handler($0)
            }
        )
    }
    
}
