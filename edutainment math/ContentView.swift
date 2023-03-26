//
//  ContentView.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount_of_questions: Int = 5
    @State private var question_set: [Question] = [Question(questionNumber: 0, input_1: 2, input_2: 5)]
    
    @State private var current_question_count: Int = 0
    @State private var correct_answers: Int = 0
    
    @State private var least_range: Double = 2
    @State private var greatest_range: Double = 12
    
    @State private var settings_mode: Bool = false
    
    var body: some View {
        return VStack {
            NavigationView {
                
                VStack() {

                    NavigationLink("Settings", destination: settings(amount_of_questions: $amount_of_questions, question_set: $question_set, current_question_count: $current_question_count, correct_answers: $correct_answers, least_range: $least_range, greatest_range: $greatest_range, settings_mode: $settings_mode)
                    )
                    .backgroundStyle(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)

                    
                    math_fun_time()

                }
                
            }
            
                .padding()
            

        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct settings: View {
        let selectable_amount: [Int] = [5, 10, 20]
        
        
        @Binding var amount_of_questions: Int
        @Binding var question_set: [Question]
        
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
        
        func new_game_state() {
            create_set_questions()
            current_question_count = 0
            correct_answers = 0
        }
        
        func create_set_questions() {
            var create_set_questions: [Question] = []
            
            var index:Int = 0
            while index < amount_of_questions {
                var is_it_a_duplicate_question:Bool = false
                
                // Create question
                let new_input_1: Double = Double(Int.random(in: Int(least_range)...Int(greatest_range)))
                let new_input_2: Double = Double(Int.random(in: Int(least_range)...Int(greatest_range)))
                let new_question:Question = Question(questionNumber: index, input_1: new_input_1, input_2: new_input_2)
                
                
//                // Check if there are duplicate values
                    /*
                        This idea is removed as it would cause a bootloop when the range is small.
                     */
//                for value in create_set_questions {
//                    let val_1 = value.input_1
//
//                    if val_1 == new_input_1 {
//                        let val_2 = value.input_2
//
//                        if val_2 == new_input_2 {
//                            is_it_a_duplicate_question = true
//                            break
//                        }
//                    }
//                }
                
                if is_it_a_duplicate_question {
                    continue
                }
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
