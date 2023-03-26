//
//  ContentView.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var view_selection:String? = nil
    
    @State private var amount_of_questions: Int = 5
    @State private var question_set: [Question] = [Question(questionNumber: 0, input_1: 2, input_2: 5)]
    @State private var selected_math_operation:math_operation = math_operation.multiplication
    
    @State private var current_question_count: Int = 0
    @State private var correct_answers: Int = 0
    
    @State private var least_range: Double = 2
    @State private var greatest_range: Double = 12
    
    @State private var settings_mode: Bool = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                NavigationLink(destination: settings(amount_of_questions: $amount_of_questions, question_set: $question_set, selected_math_operation: $selected_math_operation, current_question_count: $current_question_count, correct_answers: $correct_answers, least_range: $least_range, greatest_range: $greatest_range, settings_mode: $settings_mode)) {
                    
                    Text("Settings")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("math")
                
                math_fun_time()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // RFER #2
        .padding()
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct settings: View {
        let selectable_amount: [Int] = [5, 10, 20]
        let selectable_math_operations: [String] = [
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
        ]
        
        
        @Binding var amount_of_questions: Int
        @Binding var question_set: [Question]
        @Binding var selected_math_operation:math_operation

        
        @Binding var current_question_count: Int
        @Binding var correct_answers: Int
        
        @Binding var least_range: Double
        @Binding var greatest_range: Double
        
        @Binding var settings_mode: Bool
        
        
        var body: some View {
            return VStack {
                
                List {
                    Section("Muiltiplication Table") {
                        Stepper("Least: \(least_range.formatted())", value: $least_range.onChange() { _ in
                            new_game_state()}, in: 2...12
                        )
                        
                        Stepper("Greatest: \(greatest_range.formatted())", value: $greatest_range.onChange() { _ in
                            new_game_state()}, in:2...12
                        )
                    }
                    
                    Section("Select amount of questions") {
                        Picker("How many questions?",
                               selection: $amount_of_questions.onChange() { _ in
                                new_game_state()}) {
                            ForEach(selectable_amount, id: \.self) { num in
                                Text(String(num))
                            }
                        }
                        .pickerStyle(.segmented)

                        
                    }
                    
                    Section("Math Operation") {
                        Picker("Selected your desired operation", selection: $selected_math_operation.onChange() {_ in new_game_state()}) {
                        
                            ForEach(math_operation.allCases, id: \.self
                            ) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                    
                    Section("Debugging"){
                        // Debugging purposes
                        VStack {
                            Text("Select amount of questions: \(amount_of_questions)")
                            Text("Question #\(current_question_count + 1)")
                            Text("Correct Answers: \(correct_answers)")
                            
                            Text("Is it settings mode state: \(String(settings_mode))")
                            Text("Operation: \(selected_math_operation.rawValue)")
                        }
                        .padding()
                        
                    }
                    
                    Section("Questions") {
                        ForEach(question_set) { question in
                            Text(question.product_question())
                        }
                    }
                }
            }
            .padding()
            .onAppear(perform: create_set_questions)
            .backgroundStyle(.primary)
        }
        
        func new_game_state() {
            create_set_questions()
            current_question_count = 0
            correct_answers = 0
        }
        
        func create_set_questions() {
            var create_set_questions: [Question] = []
            
            var index:Int = 0
            while index < amount_of_questions {
                
                // Create question
                let new_input_1: Double = Double(Int.random(in: Int(least_range)...Int(greatest_range)))
                let new_input_2: Double = Double(Int.random(in: Int(least_range)...Int(greatest_range)))
                let new_question:Question = Question(questionNumber: index, input_1: new_input_1, input_2: new_input_2)

                // Add to list and continue to loop
                create_set_questions.append(new_question)
                index += 1
            }
            
            question_set = create_set_questions
        }
    }
}

struct math_fun_time: View {
    
    var body: some View {
        return NavigationStack {
            Text("Hello world!")
        }
    }
    
}

extension Binding {
    
    // RFER #1
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
    
}
