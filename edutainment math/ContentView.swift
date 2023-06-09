//
//  ContentView.swift
//  edutainment math
//
//  Created by Seika Hirori on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var view_selection:String? = nil
    
    // Settings for math questions
    @State private var amount_of_questions: Int = 5
    @State private var question_set: [Question] = [Question(questionNumber: 0, input_1: 2, input_2: 5)]
    @State private var selected_math_operation:math_operation = math_operation.multiplication
    
    // Math problems
    @State private var least_range: Double = 2
    @State private var greatest_range: Double = 12
    
    // Currently not used
    @State private var settings_mode: Bool = false
    
    @State private var current_question_count: Int = 0
    @State private var correct_answers: Int = 0
    
    // Keyboard
    @FocusState private var is_keyboard_focused: UUID?
    
    // Session
    @State private var game_session_finished: Bool = false
    
    // Update game settings
    @State private var go_update_questions_with_new_settings: Bool = false
    
    // Game History
    @State private var session_count:Int = 1
    @State private var history_session_corrects:[session_info] = []
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                ZStack {
                    VStack (spacing: 5) {
                        NavigationLink(destination: settings(
                                amount_of_questions: $amount_of_questions,
                                question_set: $question_set,
                                selected_math_operation: $selected_math_operation,
                                current_question_count: $current_question_count ,
                                correct_answers: $correct_answers ,
                                least_range: $least_range ,
                                greatest_range: $greatest_range ,
                                settings_mode: $settings_mode,
                                history_session_corrects: $history_session_corrects,
                                go_update_questions_with_new_settings: $go_update_questions_with_new_settings,
                                function_update_game_settings: {
                                    self.update_with_new_settings()
                                }
                            )
                        ) {
                            Text("Settings")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                        
                        Spacer()
                    }
                    .onAppear {
                        if go_update_questions_with_new_settings {
                            update_with_new_settings()
                        }
                    }
                    
                    
                    VStack {
                        math_fun_time(
                            question_set: $question_set,
                            selected_math_operation: $selected_math_operation,
                              current_question_count: $current_question_count,
                              correct_answers: $correct_answers,
                              is_keyboard_focused: $is_keyboard_focused,
                              game_session_finished: $game_session_finished,
                              function_new_game_state: {
                                  self.restart_game_session()
                                  
                              }
                        )
                        
                        // RFER #5
                        Image("PNG/Square/bear")
                            
                    }

                    
                }
            }
        }
        //        .navigationViewStyle(StackNavigationViewStyle()) // RFER #2
        .padding()
        .onAppear {
            new_game_state()
        }
    }
    
    func update_with_new_settings() {
        new_game_state()
    
        // Reset go_update_questions_with_new_settings
        go_update_questions_with_new_settings = false

    }
    
    func restart_game_session() {
        store_session_into_history()
        session_count += 1

        
        new_game_state()
        
        // Reset game_session_finished
        game_session_finished = false
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
    
    func store_session_into_history() {
        let new_session_count:Int = session_count
        let new_correct_answers:Int = correct_answers
        let new_total_questions:Int = question_set.count
        
        let new_save:session_info = session_info(session_number: new_session_count, correct_answers: new_correct_answers, total_questions: new_total_questions)
        
        history_session_corrects.append(new_save)
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
    @Binding var selected_math_operation:math_operation

    
    @Binding var current_question_count: Int
    @Binding var correct_answers: Int
    
    @Binding var least_range: Double
    @Binding var greatest_range: Double
    
    @Binding var settings_mode: Bool
    
    // History
    @Binding var history_session_corrects: [session_info]
    
    @Binding var go_update_questions_with_new_settings:Bool
    
    // Inherit function from parent
    var function_update_game_settings:() -> Void

    
    var body: some View {
        return VStack {
            
            List {
                Button("Manually Update") {
                    function_update_game_settings()
                }
                
                Section("Range Table") {
                    Stepper("Least: \(least_range.formatted())",
                        value: $least_range.onChange { _ in
                            queue_update_game_settings()
                        },
                            in: 2...(greatest_range-1)
                        )
                        
                    Stepper("Greatest: \(greatest_range.formatted())",
                        value: $greatest_range.onChange { _ in
                            queue_update_game_settings()
                        },
                            in:(least_range+1)...12
                    )
                }
                
                Section("Select amount of questions") {
                    Picker("How many questions?",
                           selection: $amount_of_questions.onChange { _ in
                                queue_update_game_settings()
                            }
                    ) {
                        ForEach(selectable_amount, id: \.self) { num in
                            Text(String(num))
                        }
                        
                    }
                    .pickerStyle(.segmented)

                    
                }
                
                Section("Math Operation") {
                    Picker("Selected your desired operation",
                           selection: $selected_math_operation.onChange { _ in
                                queue_update_game_settings()
                            }
                    ) {
                    
                        ForEach(math_operation.allCases, id: \.self
                        ) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("Debugging Status"){
                    // Debugging purposes
                    VStack (alignment:.center) {
                        Text("Select amount of questions: \(amount_of_questions)")
                        Text("Question #\(current_question_count + 1)")
                        Text("Correct Answers: \(correct_answers)")
                        
                        Text("Is it settings mode state: \(String(settings_mode))")
                        Text("Operation: \(selected_math_operation.rawValue)")
                        Text("Queue to update game settings: \(String(go_update_questions_with_new_settings))")
                    }
                    .padding()
                    
                }
                
                Section("History") {
                    if history_session_corrects.isEmpty == false {
                        ForEach((0..<history_session_corrects.count).reversed(), id: \.self) {
                            let item = history_session_corrects[$0]
                            
                            Text("Session \(item.session_number): \(item.correct_answers) / \(item.total_questions)")
                        }
                    } else {
                        Text("Do some math problems :3")
                    }
                }
//
//                Section("Questions") {
//                    ForEach(question_set) { question in
//                        switch selected_math_operation {
//                            case math_operation.multiplication:
//                                Text(question.product_question())
//                            case math_operation.addition:
//                                Text(question.sum_question())
//                            case math_operation.subtraction:
//                                Text(question.difference_question())
//                            case math_operation.division:
//                                Text(question.quotient_question())
//                            default:
//                                Text("meep")
//
//                        }
//
//                    }
//                }
            }
        }
        .padding()
        .backgroundStyle(.primary)
    }
    
    
    func queue_update_game_settings() -> () {
        go_update_questions_with_new_settings = true

    }
}


struct math_fun_time: View {
    
    @Binding var question_set: [Question]
    @Binding var selected_math_operation:math_operation

    @Binding var current_question_count: Int
    @Binding var correct_answers: Int
    
    // Binding @FocusState by using UUID // RFER #3
    var is_keyboard_focused: FocusState<UUID?>.Binding
    @State var UUID_is_keyboard_focused: UUID = UUID()
    
    @State private var current_question: String? = nil
    @State private var answer: Double? = nil
    
    @State private var user_submission: Double? = nil
    
    @State private var result:String = "waiting"
    
    @Binding var game_session_finished: Bool
    
    
    
    // RFER #4
    var function_new_game_state:() -> Void

    
    var body: some View {
        return VStack {
            
            Text("Hello :3\n")
            List {
                Section("Question #\(current_question_count + 1)"){
                    
                    Text("What is")
                    Text("\(current_question ?? "ERROR: Question not loaded")")
                    
                }
                
                Section("Submission") {
                    HStack {
                        TextField("Submission", value: $user_submission, format: .number)
                            .focused(is_keyboard_focused, equals: UUID_is_keyboard_focused) // RFER #3
                            .keyboardType(.decimalPad)
                        Spacer()
                        Button("Submit") {
                            user_submmited_answer()
                        }
                        .alert("Finished",isPresented: $game_session_finished) {
                            Button("Restart", action:{
                                function_new_game_state()
                                // Have to manually load new question
                                load_data_of_question()
                            })
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .background(Color.accentColor)
                        .foregroundColor(Color.black)

                       
                        
                    }
                    .onSubmit { // User needs to press "Enter" to check answer
                        user_submmited_answer()
                    }
                    
                }
                
                Section("Result") {
                    Text("Correct answers: \(correct_answers)")
                }
            }
            .onAppear(perform: inital_launch)
            
        }
        
    }
    
    func inital_launch() {
        load_data_of_question()
    }
    
    func next_question() {
        
    }
    
    func load_data_of_question() {
        let item = question_set[current_question_count]
        
        switch selected_math_operation {
            case math_operation.multiplication:
                current_question = item.product_question()
                answer = item.multiplication()
            case math_operation.addition:
                current_question = item.sum_question()
                answer = item.addition()
            case math_operation.division:
                current_question = item.quotient_question()
                answer = item.division()
            case math_operation.subtraction:
                current_question = item.difference_question()
                answer = item.subtraction()
            default:
                current_question = ":'("
                answer = -999999
        }
        
    }
    
    func user_submmited_answer() {
        check_answer_is_correct()
        print("Just checked answer")
        print("index before modifying: \(current_question_count)")
        
        
        let total_amount_of_questions: Int = question_set.count
        
        let new_count:Int = current_question_count + 1
        
        // New count should
        if new_count < total_amount_of_questions {
            
            current_question_count = new_count
            print("Index increased to: \(current_question_count) ")
        } else {
            // Bring up results after answering all questions
            print("all questions done")
        }
        
        
        user_submission = nil
        
        // Load next question if current_question is less than total amount of questions
        if new_count < total_amount_of_questions {
            load_data_of_question()
        } else {
            print("no more questions :'[ ")
            last_question_reached()
        }
        
        assert(new_count <= question_set.count, "The new_count (index) '\(new_count)' should not be greater than or equal [>=] to the total amount of questions '\(total_amount_of_questions)'. This will cause the loading the next question to be out of array range.")
        
        
    }
    
    func check_answer_is_correct() {
        
        if user_submission == answer {
            correct_answers += 1
        }
    }
    
    func last_question_reached() {
        game_session_finished = true
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
