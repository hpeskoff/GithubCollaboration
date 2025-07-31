import SwiftUI
import SwiftData
struct Sleep: View {
    @State private var step = 1
    
    @State private var age: String = ""
    @State private var gender: String = "male"
    
    @State private var recommendedSleep: String = ""
    @State private var gettingRecommendedSleep: String? = nil
    @State private var feelsWellRested: String? = nil
    @State private var qualityOfSleep = "Not enough data. Try Again."
    
    var body: some View {
        NavigationStack {
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 1.0, green: 0.98, blue: 0.94))
        }
    }
    
    var askAgeView: some View {
        VStack(spacing: 20) {
            Image("SleepPic")
                .resizable()
                .frame(width: 400, height: 200)
            
            Text("How old are you?")
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            
            TextField("Enter your age", text: $age)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(white: 0.9))
                .cornerRadius(8)
                .frame(width: 150)
                .font(.custom("Baby Doll", size: 16))
            
            Button("Next") {
                if let ageInt = Int(age), ageInt > 0 {
                    recommendedSleep = sleep_tool(gender: gender, age: ageInt)
                    step = 2
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.custom("Baby Doll", size: 20))
            .tint(.cyan)
            .disabled(Int(age) == nil || Int(age)! <= 0)
        }
    }
    
    var askGettingSleepView: some View {
        VStack(spacing: 20) {
            Image("SleepPic")
                .resizable()
                .frame(width: 400, height: 200)
            
            Text("Are you getting \(recommendedSleep) every night?")
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                .multilineTextAlignment(.center)
            
            HStack(spacing: 40) {
                Button("Yes") {
                    gettingRecommendedSleep = "yes"
                    step = 3
                }
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
                .font(.custom("Baby Doll", size: 16))
                
                Button("No") {
                    gettingRecommendedSleep = "no"
                    step = 3
                }
                .buttonStyle(.bordered)
                .tint(.cyan)
                .font(.custom("Baby Doll", size: 16))
            }
        }
    }
    
    var askWellRestedView: some View {
        VStack(spacing: 20) {
            Image("SleepPic")
                .resizable()
                .frame(width: 400, height: 200)
            
            Text("Do you feel well rested every day?")
                .font(.custom("Baby Doll", size: 40))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            
            HStack(spacing: 40) {
                Button("Yes") {
                    feelsWellRested = "yes"
                    qualityOfSleep = calculateSleepRating()
                    step = 4
                }
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
                .font(.custom("Baby Doll", size: 20))
                
                Button("No") {
                    feelsWellRested = "no"
                    qualityOfSleep = calculateSleepRating()
                    step = 4
                }
                .buttonStyle(.bordered)
                .font(.custom("Baby Doll", size: 20))
                .tint(.cyan)
            }
        }
    }
    
    var showResultView: some View {
        VStack(spacing: 25) {
            Text("Your sleep quality rating is:")
                .font(.custom("Baby Doll", size: 30))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            
            Text(calculateSleepRating())
                .font(.largeTitle)
                .bold()
                .foregroundColor(colorForRating())
            
            // OG STYLE NEXT — cyan button, no glow
            NavigationLink(destination: SleepInfo(qualityOfSleep: qualityOfSleep)) {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .tint(.cyan)
            .font(.custom("Baby Doll", size: 20))
            
            // Grayed-out Restart — still clickable
            Button("Restart") {
                resetQuiz()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            .background(Color.cyan.opacity(0.2))
            .foregroundColor(.cyan)
            .cornerRadius(12)
            .font(.custom("Baby Doll", size: 20))
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
        if gettingRecommendedSleep == "yes" && feelsWellRested == "yes" {
            qualityOfSleep = "Excellent"
        } else if gettingRecommendedSleep == "no" && feelsWellRested == "no" {
            qualityOfSleep = "Poor"
        } else {
            qualityOfSleep = "Not Bad"
        }
        return qualityOfSleep
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
#Preview {
    Sleep()
}


