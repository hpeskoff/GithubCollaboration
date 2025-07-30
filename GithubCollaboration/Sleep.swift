//import SwiftUI
//struct Sleep: View {
//    @State private var step = 1
//    
//    @State private var age: String = ""
//    @State private var gender: String = "male" // can extend later
//    
//    @State private var recommendedSleep: String = ""
//    @State private var gettingRecommendedSleep: String? = nil  // "yes"/"no"
//    @State private var feelsWellRested: String? = nil          // "yes"/"no"
//    
//    var body: some View {
//        VStack(spacing: 30) {
//            if step == 1 {
//                askAgeView
//            } else if step == 2 {
//                askGettingSleepView
//            } else if step == 3 {
//                askWellRestedView
//            } else if step == 4 {
//                showResultView
//            } else {
//                Text("Error")
//            }
//        }
//        .padding()
//        .animation(.default, value: step)
//    }
//    
//    var askAgeView: some View {
//        VStack(spacing: 20) {
//            Text("How old are you?")
//                .font(.title2)
//            
//            TextField("Enter your age", text: $age)
//                .keyboardType(.numberPad)
//                .padding()
//                .background(Color(white: 0.9))
//                .cornerRadius(8)
//                .frame(width: 150)
//            
//            Button("Next") {
//                if let ageInt = Int(age), ageInt > 0 {
//                    recommendedSleep = sleep_tool(gender: gender, age: ageInt)
//                    step = 2
//                }
//            }
//            .buttonStyle(.borderedProminent)
//            .disabled(Int(age) == nil || Int(age)! <= 0)
//        }
//    }
//    
//    var askGettingSleepView: some View {
//        VStack(spacing: 20) {
//            Text("Are you getting \(recommendedSleep) every night?")
//                .font(.title3)
//                .multilineTextAlignment(.center)
//            
//            HStack(spacing: 40) {
//                Button("Yes") {
//                    gettingRecommendedSleep = "yes"
//                    step = 3
//                }
//                .buttonStyle(.borderedProminent)
//                
//                Button("No") {
//                    gettingRecommendedSleep = "no"
//                    step = 3
//                }
//                .buttonStyle(.bordered)
//            }
//        }
//    }
//    
//    var askWellRestedView: some View {
//        VStack(spacing: 20) {
//            Text("Do you feel well rested every day?")
//                .font(.title3)
//            
//            HStack(spacing: 40) {
//                Button("Yes") {
//                    feelsWellRested = "yes"
//                    step = 4
//                }
//                .buttonStyle(.borderedProminent)
//                
//                Button("No") {
//                    feelsWellRested = "no"
//                    step = 4
//                }
//                .buttonStyle(.bordered)
//            }
//        }
//    }
//    
//    var showResultView: some View {
//        VStack(spacing: 20) {
//            Text("Your sleep quality rating is:")
//                .font(.title2)
//            
//            Text(calculateSleepRating())
//                .font(.largeTitle)
//                .bold()
//                .foregroundColor(colorForRating())
//            
//            NavigationStack {
//                NavigationLink(destination: SleepInfo()) {
//                    Text("Next")
//                }
//            }
//            Button("Restart") {
//                resetQuiz()
//            }
//            Button("Next") {
//            }
//            .buttonStyle(.borderedProminent)
//        }
//    }
//    
//    func sleep_tool(gender: String, age: Int) -> String {
//        if gender == "male" && age >= 3 && age <= 5 {
//            return "10 to 13 hours of sleep"
//        } else if age >= 6 && age <= 12 {
//            return "9 to 12 hours of sleep"
//        } else if age >= 13 && age <= 18 {
//            return "8 to 10 hours of sleep"
//        } else {
//            return "7 to 9 hours of sleep"
//        }
//    }
//    
//    struct SleepTracker {
//        var feelsWellRested: String?
//        var gettingRecommendedSleep: String?
//        
//        func calculateSleepRating() -> String {
//            if let gettingSleep = gettingRecommendedSleep, let rested = feelsWellRested {
//                if gettingSleep == "yes" && rested == "yes" {
//                    return "Excellent"
//                } else if gettingSleep == "no" && rested == "no" {
//                    return "Poor"
//                } else {
//                    return "Not Bad"
//                }
//            } else {
//                return "Not enough data"
//            }
//        }
//        
//        func colorForRating() -> Color {
//            let rating = calculateSleepRating()
//            if rating == "Excellent" {
//                return .green
//            } else if rating == "Not Bad" {
//                return .orange
//            } else if rating == "Poor" {
//                return .red
//            } else {
//                return .gray
//            }
//        }
//        
//        func resetQuiz() {
//            var age = ""
//            var recommendedSleep = ""
//            var gettingRecommendedSleep: String? = nil
//            var feelsWellRested: String? = nil
//            var step = 1
//        }
//        
//    }
//}
import SwiftUI
import SwiftData

struct Sleep: View {
    @State private var step = 1

    @State private var age: String = ""
    @State private var gender: String = "male"

    @State private var recommendedSleep: String = ""
    @State private var gettingRecommendedSleep: String? = nil
    @State private var feelsWellRested: String? = nil

    var body: some View {
        VStack(spacing: 30) {
            if step == 1 {
                askAgeView
            } else if step == 2 {
                askGettingSleepView
            } else if step == 3 {
                askWellRestedView
            } else if step == 4 {
                showResultView
            } else {
                Text("Error")
                    .font(.custom("Baby Doll", size: 40))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            }
        }
        .padding()
        .animation(.default, value: step)
    }

    var askAgeView: some View {
        VStack(spacing: 20) {
            Text("How old are you?")
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                .font(.title2)

            TextField("Enter your age", text: $age)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(white: 0.9))
                .cornerRadius(8)
                .frame(width: 150)

            Button("Next") {
                
                if let ageInt = Int(age), ageInt > 0 {
                    recommendedSleep = sleep_tool(gender: gender, age: ageInt)
                    step = 2
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(Int(age) == nil || Int(age)! <= 0)
        }
    }

    var askGettingSleepView: some View {
        VStack(spacing: 20) {
            Text("Are you getting \(recommendedSleep) every night?")
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                .font(.title3)
                .multilineTextAlignment(.center)

            HStack(spacing: 40) {
                Button("Yes") {
                    gettingRecommendedSleep = "yes"
                    step = 3
                }
                .buttonStyle(.borderedProminent)

                Button("No") {
                    gettingRecommendedSleep = "no"
                    step = 3
                }
                .buttonStyle(.bordered)
            }
        }
    }

    var askWellRestedView: some View {
        VStack(spacing: 20) {
            Text("Do you feel well rested every day?")
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                .font(.title3)

            HStack(spacing: 40) {
                Button("Yes") {
                    feelsWellRested = "yes"
                    step = 4
                }
                .buttonStyle(.borderedProminent)

                Button("No") {
                    feelsWellRested = "no"
                    step = 4
                }
                .buttonStyle(.bordered)
            }
        }
    }

    var showResultView: some View {
        VStack(spacing: 20) {
            Text("Your sleep quality rating is:")
                .font(.title2)
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))

            Text(calculateSleepRating())
                .font(.largeTitle)
                .bold()
                .foregroundColor(colorForRating())

            NavigationStack {
                NavigationLink(destination: SleepInfo()) {
                    Text("Next")
                        .buttonStyle(.borderedProminent)

                }
            }

            Button("Restart") {
                resetQuiz()
            }
            .buttonStyle(.borderedProminent)
        }
    }

    func sleep_tool(gender: String, age: Int) -> String {
        if gender == "male" && age >= 3 && age <= 5 {
            return "10 to 13 hours of sleep"
        } else if age >= 6 && age <= 12 {
            return "9 to 12 hours of sleep"
        } else if age >= 13 && age <= 18 {
            return "8 to 10 hours of sleep"
        } else {
            return "7 to 9 hours of sleep"
        }
    }

    func calculateSleepRating() -> String {
        if let gettingSleep = gettingRecommendedSleep, let rested = feelsWellRested {
            if gettingSleep == "yes" && rested == "yes" {
                return "Excellent"
            } else if gettingSleep == "no" && rested == "no" {
                return "Poor"
            } else {
                return "Not Bad"
            }
        } else {
            return "Not enough data"
        }
    }

    func colorForRating() -> Color {
        let rating = calculateSleepRating()
        switch rating {
        case "Excellent": return .green
        case "Not Bad": return .orange
        case "Poor": return .red
        default: return .gray
        }
    }

    func resetQuiz() {
        age = ""
        recommendedSleep = ""
        gettingRecommendedSleep = nil
        feelsWellRested = nil
        step = 1
    }
}
