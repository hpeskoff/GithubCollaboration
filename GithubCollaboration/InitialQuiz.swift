import SwiftUI
struct Question {
    let text: String
    let choices: [String]
    let scores: [String: [String: (sleep: Double, nutrition: Double, social: Double)]]
    
}
struct InitialQuiz: View {
    @State private var showForm = false
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswers: [String] = Array(repeating: "", count: 9)
    @State private var showResults = false
    @State private var result = ""
    
    @State private var sleepScore = 0.0
    @State private var nutritionScore = 0.0
    @State private var socialScore = 0.0
    
    @State private var customNotes: String = ""
    let questions: [Question] = [
        Question(
            text: "Age Group",
            choices: ["3-5", "6-12", "13-22", "23-64", "65+"],
            scores: [:]
        ),
        
        Question(
            text: "Gender",
            choices: ["Male", "Female"],
            scores: [:]
        ),
        
        Question(
            text: "How many hours of sleep do you get per night?",
            choices: ["Less than 4","4-6","6-7","7-9","9+"],
            scores: [
                "3-5": [
                    "Less than 4": (sleep: 1, nutrition: 0, social: 0),
                    "4-6": (sleep: 2, nutrition: 0, social: 0),
                    "6-7": (sleep: 3, nutrition: 0, social: 0),
                    "7-9": (sleep: 4, nutrition: 0, social: 0),
                    "9+": (sleep: 5, nutrition: 0, social: 0),
                ],
                "6-12": [
                    "Less than 4": (sleep: 1, nutrition: 0, social: 0),
                    "4-6": (sleep: 2, nutrition: 0, social: 0),
                    "6-7": (sleep: 3, nutrition: 0, social: 0),
                    "7-9": (sleep: 4.5, nutrition: 0, social: 0),
                    "9+": (sleep: 5, nutrition: 0, social: 0),
                ],
                "13-22": [
                    "Less than 4": (sleep: 1, nutrition: 0, social: 0),
                    "4-6": (sleep: 2, nutrition: 0, social: 0),
                    "6-7": (sleep: 3, nutrition: 0, social: 0),
                    "7-9": (sleep: 5, nutrition: 0, social: 0),
                    "9+": (sleep: 4.3, nutrition: 0, social: 0),
                ],
                "23-64": [
                    "Less than 4": (sleep: 2, nutrition: 0, social: 0),
                    "4-6": (sleep: 3, nutrition: 0, social: 0),
                    "6-7": (sleep: 4, nutrition: 0, social: 0),
                    "7-9": (sleep: 5, nutrition: 0, social: 0),
                    "9+": (sleep: 4, nutrition: 0, social: 0),
                ],
                "65+": [
                    "Less than 4": (sleep: 2, nutrition: 0, social: 0),
                    "4-6": (sleep: 3, nutrition: 0, social: 0),
                    "6-7": (sleep: 5, nutrition: 0, social: 0),
                    "7-9": (sleep: 5, nutrition: 0, social: 0),
                    "9+": (sleep: 4, nutrition: 0, social: 0),
            ]
          ]
        ),
        
        Question(
            text: "How much water do you intake daily?",
            choices: ["Less than 2 cups","2-4 cups","5-7 cups","8-10 cups","11+ cups"],
            scores: [
                "3-5": [
                    "Less than 2 cups": (sleep: 0, nutrition: 0.2, social: 0),
                    "2-4 cups": (sleep: 0, nutrition: 1.67, social: 0),
                    "5-7 cups": (sleep: 0, nutrition: 1.3, social: 0),
                    "8-10 cups": (sleep: 0, nutrition: 0.9, social: 0),
                    "11+ cups": (sleep: 0, nutrition: 0.2, social: 0),
                ],
                "6-12": [
                    "Less than 2 cups": (sleep: 0, nutrition: 0.2, social: 0),
                    "2-4 cups": (sleep: 0, nutrition: 0.8, social: 0),
                    "5-7 cups": (sleep: 0, nutrition: 1.67, social: 0),
                    "8-10 cups": (sleep: 0, nutrition: 1.67, social: 0),
                    "11+ cups": (sleep: 0, nutrition: 1.0, social: 0),
                ],
                "13-22": [
                    "Less than 2 cups": (sleep: 0, nutrition: 0.2, social: 0),
                    "2-4 cups": (sleep: 0, nutrition: 0.8, social: 0),
                    "5-7 cups": (sleep: 0, nutrition: 1.2, social: 0),
                    "8-10 cups": (sleep: 0, nutrition: 1.67, social: 0),
                    "11+ cups": (sleep: 0, nutrition: 1.0, social: 0),
                ],
                "23-64": [
                    "Less than 2 cups": (sleep: 0, nutrition: 0.2, social: 0),
                    "2-4 cups": (sleep: 0, nutrition: 0.8, social: 0),
                    "5-7 cups": (sleep: 0, nutrition: 1.2, social: 0),
                    "8-10 cups": (sleep: 0, nutrition: 1.67, social: 0),
                    "11+ cups": (sleep: 0, nutrition: 1.2, social: 0),
                ],
                "65+": [
                    "Less than 2 cups": (sleep: 0, nutrition: 0.2, social: 0),
                    "2-4 cups": (sleep: 0, nutrition: 0.8, social: 0),
                    "5-7 cups": (sleep: 0, nutrition: 1.2, social: 0),
                    "8-10 cups": (sleep: 0, nutrition: 1.67, social: 0),
                    "11+ cups": (sleep: 0, nutrition: 1.3, social: 0),
            ]
          ]
        ),
        
        Question(
            text: "How fulfilled do you feel socially each day?",
            choices: ["Not fulfilled","Fulfilled","Very fulfilled"],
            scores: [
                "3-5": [
                    "Not fulfilled": (sleep: 0, nutrition: 0, social: 0.4),
                    "Fulfilled": (sleep: 0, nutrition: 0, social: 1.0),
                    "Very fulfilled": (sleep: 0, nutrition: 0, social: 1.67),
                ],
                "6-12": [
                    "Not fulfilled": (sleep: 0, nutrition: 0, social: 0.4),
                    "Fulfilled": (sleep: 0, nutrition: 0, social: 1.0),
                    "Very fulfilled": (sleep: 0, nutrition: 0, social: 1.67),
                ],
                "13-22": [
                    "Not fulfilled": (sleep: 0, nutrition: 0, social: 0.4),
                    "Fulfilled": (sleep: 0, nutrition: 0, social: 1.0),
                    "Very fulfilled": (sleep: 0, nutrition: 0, social: 1.67),                ],
                "23-64": [
                    "Not fulfilled": (sleep: 0, nutrition: 0, social: 0.4),
                    "Fulfilled": (sleep: 0, nutrition: 0, social: 1.0),
                    "Very fulfilled": (sleep: 0, nutrition: 0, social: 1.67),
                ],
                "65+": [
                    "Not fulfilled": (sleep: 0, nutrition: 0, social: 0.4),
                    "Fulfilled": (sleep: 0, nutrition: 0, social: 1.0),
                    "Very fulfilled": (sleep: 0, nutrition: 0, social: 1.67),
            ]
          ]
        ),
        
        Question(
            text: "How many meals do you eat a day?",
            choices: ["Less than 1","1-2","2-3", "4+"],
            scores: [
                "3-5": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-2": (sleep: 0, nutrition: 1.0, social: 0),
                    "2-3": (sleep: 0, nutrition: 1.67, social: 0),
                    "4+": (sleep: 0, nutrition: 1.3, social: 0),
                ],
                "6-12": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-2": (sleep: 0, nutrition: 1.0, social: 0),
                    "2-3": (sleep: 0, nutrition: 1.67, social: 0),
                    "4+": (sleep: 0, nutrition: 1.3, social: 0),
                ],
                "13-22": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-2": (sleep: 0, nutrition: 1.0, social: 0),
                    "2-3": (sleep: 0, nutrition: 1.67, social: 0),
                    "4+": (sleep: 0, nutrition: 1.3, social: 0),
                ],
                "23-64": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-2": (sleep: 0, nutrition: 1.0, social: 0),
                    "2-3": (sleep: 0, nutrition: 1.67, social: 0),
                    "4+": (sleep: 0, nutrition: 1.3, social: 0),
                ],
                "65+": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-2": (sleep: 0, nutrition: 1.0, social: 0),
                    "2-3": (sleep: 0, nutrition: 1.67, social: 0),
                    "4+": (sleep: 0, nutrition: 1.3, social: 0),
            ]
          ]
        ),
        
        Question(
            text: "How many different types of fruits/vegetables do you intake daily?",
            choices: ["Less than 1","1-3","3-4", "5+"],
            scores: [
                "3-5": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-3": (sleep: 0, nutrition: 1.67, social: 0),
                    "3-4": (sleep: 0, nutrition: 1.2, social: 0),
                    "5+": (sleep: 0, nutrition: 0.8, social: 0),
                ],
                "6-12": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-3": (sleep: 0, nutrition: 1.2, social: 0),
                    "3-4": (sleep: 0, nutrition: 1.67, social: 0),
                    "5+": (sleep: 0, nutrition: 0.8, social: 0),
                ],
                "13-22": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-3": (sleep: 0, nutrition: 0.8, social: 0),
                    "3-4": (sleep: 0, nutrition: 1.67, social: 0),
                    "5+": (sleep: 0, nutrition: 1.3, social: 0),
                ],
                "23-64": [
                    "Less than 1": (sleep: 0, nutrition: 0.4, social: 0),
                    "1-2": (sleep: 0, nutrition: 0.8, social: 0),
                    "3-4": (sleep: 0, nutrition: 1.0, social: 0),
                    "5+": (sleep: 0, nutrition: 1.67, social: 0),
                ],
                "65+": [
                    "Less than 1": (sleep: 0, nutrition: 0.6, social: 0),
                    "1-2": (sleep: 0, nutrition: 0.8, social: 0),
                    "3-4": (sleep: 0, nutrition: 1.0, social: 0),
                    "5+": (sleep: 0, nutrition: 1.67, social: 0),
            ]
          ]
        ),
        
        Question(
            text: "How many hours are you active per week?",
            choices: ["Less than 1","1-3","4-6", "7-9", "10+"],
            scores: [
                "3-5": [
                    "Less than 1": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: -0.2, nutrition: -0.2, social: 0),
                    "4-6": (sleep: -0.6, nutrition: -0.4, social: 0),
                    "7-9": (sleep: -0.8, nutrition: -0.6, social: 0),
                    "10+": (sleep: -1, nutrition: -0.8, social: 0),
                ],
                "6-12": [
                    "Less than 1": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: -0.2, nutrition: -0.2, social: 0),
                    "4-6": (sleep: -0.6, nutrition: -0.4, social: 0),
                    "7-9": (sleep: -0.8, nutrition: -0.6, social: 0),
                    "10+": (sleep: -1, nutrition: -0.8, social: 0),
                ],
                "13-22": [
                    "Less than 1": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: -0.2, nutrition: -0.2, social: 0),
                    "4-6": (sleep: -0.6, nutrition: -0.4, social: 0),
                    "7-9": (sleep: -0.8, nutrition: -0.6, social: 0),
                    "10+": (sleep: -1, nutrition: -0.8, social: 0),
                ],
                "23-64": [
                    "Less than 1": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: -0.2, nutrition: -0.2, social: 0),
                    "4-6": (sleep: -0.6, nutrition: -0.4, social: 0),
                    "7-9": (sleep: -0.8, nutrition: -0.6, social: 0),
                    "10+": (sleep: -1, nutrition: -0.8, social: 0),
                ],
                "65+": [
                    "Less than 1": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: -0.2, nutrition: -0.2, social: 0),
                    "4-6": (sleep: -0.6, nutrition: -0.4, social: 0),
                    "7-9": (sleep: -0.8, nutrition: -0.6, social: 0),
                    "10+": (sleep: -1, nutrition: -0.8, social: 0),
            ]
          ]
        ),
        
        Question(
            text: "How many chances do you get to connect with people daily?",
            choices: ["0","1-3","3-6", "6+"],
            scores: [
                "3-5": [
                    "0": (sleep: 0, nutrition: 0, social: 0.2),
                    "1-3": (sleep: 0, nutrition: 0, social: 1.67),
                    "3-6": (sleep: 0, nutrition: 0, social: 1.2),
                    "6+": (sleep: 0, nutrition: 0, social: 0.8),
                ],
                "6-12": [
                    "0": (sleep: 0, nutrition: 0, social: 0.2),
                    "1-3": (sleep: 0, nutrition: 0, social: 1.0),
                    "3-6": (sleep: 0, nutrition: 0, social: 1.67),
                    "6+": (sleep: 0, nutrition: 0, social: 1.5),
                ],
                "13-22": [
                    "0": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: 0, nutrition: 0, social: 0.8),
                    "3-6": (sleep: 0, nutrition: 0, social: 1.4),
                    "6+": (sleep: 0, nutrition: 0, social: 1.67),
                ],
                "23-64": [
                    "0": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: 0, nutrition: 0, social: 1.0),
                    "3-6": (sleep: 0, nutrition: 0, social: 1.5),
                    "6+": (sleep: 0, nutrition: 0, social: 1.67),
                ],
                "65+": [
                    "0": (sleep: 0, nutrition: 0, social: 0),
                    "1-3": (sleep: 0, nutrition: 0, social: 1.2),
                    "3-6": (sleep: 0, nutrition: 0, social: 1.67),
                    "6+": (sleep: 0, nutrition: 0, social: 1.4),
            ]
          ]
        ),
        // Add your rest of the questions here exactly like you gave me before
    ]
    
    func interpret(score: Double) -> String {
        if score >= 4.0 {
            return "Very Good"
        } else if score >= 3.0 {
            return "Good"
        } else if score >= 2.0 {
            return "Okay"
        } else if score >= 1.0 {
            return "Poor"
        } else {
            return "Very Poor"
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.286, green: 0.431, blue: 0.425)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                Image("InitialPic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x:0,y:0)
                
                if !showForm {
                    Text("Initial Evaluation")
                        .font(.custom("Baby Doll", size: 40))
                        .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94))
                        Text("If you are unsure of your lifestyle's glows and grows, this is a great place to start! Take this brief quiz to give you an overview of where you stand in your wellness journey. Then, navigate to the tools on the homepage to receive streamlined and targeted advice!")
                            .font(.custom("Quicksand_Book_Oblique", size: 18))
                            .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94))
                            .multilineTextAlignment(.center)
                            .padding()
                    Button("Start") {
                        print("hi")
                        showForm = true
                    }
                    .padding()
                    .background(Color(red: 0.85, green: 0.74, blue: 0.52))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.custom("Baby Doll", size: 20))
                
                } else if !showResults {
                    let currentQuestion = questions[currentQuestionIndex]
                    Text(currentQuestion.text)
                        .font(.custom("Baby Doll", size: 30).weight(.bold))
                        .padding()
                        .foregroundColor(Color(red: 0.85, green: 0.74, blue: 0.52))
                        .multilineTextAlignment(.center)
                    ForEach(currentQuestion.choices, id: \.self) { choice in
                        Button(action: {
                            selectedAnswers[currentQuestionIndex] = choice
                        }) {
                            Text(choice)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    selectedAnswers[currentQuestionIndex] == choice
                                    ? Color(red: 0.85, green: 0.74, blue: 0.52) // gold background when selected
                                    : Color(red: 1.0, green: 0.98, blue: 0.94) // cream background when not
                                )
                                .foregroundColor(
                                    selectedAnswers[currentQuestionIndex] == choice
                                    ? Color(red: 1.0, green: 0.98, blue: 0.94) // cream text when selected
                                    : Color(red: 0.85, green: 0.74, blue: 0.52) // gold text when not
                                )
                                .cornerRadius(10)
                                .font(.custom("Baby Doll", size: 30).weight(.bold))
                        }
                    }
                    if !selectedAnswers[currentQuestionIndex].isEmpty {
                        Button(action: {
                            if currentQuestionIndex < questions.count - 1 {
                                currentQuestionIndex += 1
                            } else {
                                calculateResult()
                                showResults = true
                            }
                        }) {
                            Text(currentQuestionIndex < questions.count - 1 ? "Next" : "Get Results")
                                .font(.custom("Baby Doll", size: 20).weight(.semibold))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color(red: 0.85, green: 0.74, blue: 0.52)) // gold
                                .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94)) // cream
                                .cornerRadius(8)
                        }
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            Text("Results")
                                .font(.custom("Baby Doll", size: 45))
                                .foregroundColor(Color(red: 0.85, green: 0.74, blue: 0.52)) // gold
                                .padding(.top, 0)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Sleep : ")
                                        .font(.custom("Baby Doll", size: 30))
                                        .foregroundColor(Color(red: 0.85, green: 0.74, blue: 0.52)) // gold
                                    Text(interpret(score: sleepScore))
                                        .font(.custom("Baby Doll", size: 24))
                                        .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94)) // cream
                                }
                                HStack {
                                    Text("Nutrition : ")
                                        .font(.custom("Baby Doll", size: 30))
                                        .foregroundColor(Color(red: 0.85, green: 0.74, blue: 0.52)) // gold
                                    Text(interpret(score: nutritionScore))
                                        .font(.custom("Baby Doll", size: 24))
                                        .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94)) // cream
                                }
                                HStack {
                                    Text("Social : ")
                                        .font(.custom("Baby Doll", size: 30))
                                        .foregroundColor(Color(red: 0.85, green: 0.74, blue: 0.52)) // gold
                                    Text(interpret(score: socialScore))
                                        .font(.custom("Baby Doll", size: 24))
                                        .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94)) // cream
                                }
                                HStack
                                {
                                    Text("Using your Results, naivgate to a wellness tool to recieve targeted advice based on your feedback.")
                                        .padding(.top, 10)
                                        .font(.custom("Quicksand_Book_Oblique", size: 18))
                                        .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94)) // cream
                                        .multilineTextAlignment(.center)
                                }
                            }
                            
                            Text("Response Overview")
                                .font(.custom("Baby Doll", size: 37))
                                .foregroundColor(Color(red: 0.85, green: 0.74, blue: 0.52)) // gold
                                .padding(.top, 20)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                ForEach(0..<questions.count, id: \.self) { i in
                                    Text("Q\(i + 1): \(selectedAnswers[i])")
                                        .font(.custom("Quicksand_Book", size: 18))
                                        .foregroundColor(Color(red: 1.0, green: 0.98, blue: 0.94)) // cream
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
            }
            .padding()
        }
    }
    
    func calculateResult() {
        print("calculateResult called!")
        
        // Make sure answers are complete
        guard selectedAnswers.count == questions.count else {
            print("Guard failed: selectedAnswers count doesn't match questions count")
            return
        }
        
        let ageGroup = selectedAnswers[0]
        if ageGroup.isEmpty {
            print("Age group is empty, returning early")
            return
        }
        
        print("Age group selected: \(ageGroup)")
        
        var sleepTotal: Double = 0
        var nutritionTotal: Double = 0
        var socialTotal: Double = 0
        
        for (index, answer) in selectedAnswers.enumerated() {
            // Skip age and gender questions because they have empty scores dictionaries
            if index == 0 || index == 1 { continue }
            
            let question = questions[index]
            print("Q\(index+1) answer: \(answer)")
            
            if let categoryScores = question.scores[ageGroup]?[answer] {
                sleepTotal += categoryScores.sleep
                nutritionTotal += categoryScores.nutrition
                socialTotal += categoryScores.social
                print("Scores found - Sleep: \(categoryScores.sleep), Nutrition: \(categoryScores.nutrition), Social: \(categoryScores.social)")
            } else {
                print("⚠️ No score found for answer '\(answer)' in age group '\(ageGroup)'")
            }
        }
        
        sleepScore = sleepTotal
        nutritionScore = nutritionTotal
        socialScore = socialTotal
        
        print("DEBUG — Sleep: \(sleepScore), Nutrition: \(nutritionScore), Social: \(socialScore)")
    }
}
#Preview {
    InitialQuiz()
}


