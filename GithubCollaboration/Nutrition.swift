//////
////// Nutrition.swift
////// GithubCollaboration
//////
////// Created by Scholar on 7/29/25.
//////
////
////
import Foundation
import SwiftUI
struct Nutrition: View {
@State private var age = ""
@State private var gender = ""
@State private var active = ""
@State private var height = ""
@State private var weight = ""
@State private var results = ""
func calculate(age_: String, gender_: String, active_: String) -> String {
 guard let ageInt = Int(age_),
    let activeInt = Int(active_),
    let heightDouble = Double(height),
    let weightDouble = Double(weight),
    (gender_ == "F" || gender_ == "M") else {
   return "Please enter valid age, gender, activity level, height, and/or weight."
 }
 var calories = 0
 var foodSuggestions = ""
 var healthyWeight = ""
 let heightInMeters = heightDouble / 100
 let bmi = weightDouble / (heightInMeters * heightInMeters)
 let bmiRounded = Int(round(bmi)) // rounds to nearest whole number as Int
 let bmiFormatted = String(format: "%.1f", bmi)
 if bmiRounded >= 19 && bmiRounded <= 24 {
   healthyWeight = " (healthy)"
 } else {
   healthyWeight = " (unhealthy)"
 }
 if gender_ == "F" {
   switch ageInt {
   case 3...8:
     calories = 1200 + (activeInt * 60)
     foodSuggestions = "Yogurt, berries, cheese, peanut butter, carrots, whole grain cereal."
   case 9...13:
     calories = 1600 + (activeInt * 70)
     foodSuggestions = "Grilled chicken, leafy greens, low-fat milk, oatmeal, eggs, oranges."
   case 14...18:
     calories = 1800 + (activeInt * 80)
     foodSuggestions = "Salmon, almonds, Greek yogurt, brown rice, broccoli, bananas."
   case 19...50:
     calories = 1800 + (activeInt * 90)
     foodSuggestions = "Avocados, quinoa, beans, spinach, tofu, cottage cheese."
   case 51...:
     calories = 1600 + (activeInt * 70)
     foodSuggestions = "Soft cooked veggies, eggs, oatmeal, yogurt, sweet potatoes, fortified cereal."
   default:
     return "Age not in supported range."
   }
 } else if gender_ == "M" {
   switch ageInt {
   case 4...8:
     calories = 1400 + (activeInt * 70)
     foodSuggestions = "Scrambled eggs, bananas, whole grain toast, milk, peas, turkey slices."
   case 9...13:
     calories = 1800 + (activeInt * 90)
     foodSuggestions = "Chicken wraps, fruit smoothies, spinach, boiled eggs, nuts, pasta."
   case 14...18:
     calories = 2200 + (activeInt * 100)
     foodSuggestions = "Steak, whole wheat bread, kale, beans, oranges, yogurt, tuna."
   case 19...50:
     calories = 2200 + (activeInt * 110)
     foodSuggestions = "Salmon, eggs, whole grains, legumes, sweet potatoes, spinach."
   case 51...:
     calories = 2000 + (activeInt * 90)
     foodSuggestions = "Steamed veggies, lentil soup, fish, oats, cooked apples, low-fat dairy."
   default:
     return "Age not in supported range."
   }
 }
 return """
 Estimated daily calories: \(calories)
 
 BMI: \(bmiFormatted)\(healthyWeight)
 
 Recommended foods:
 \(foodSuggestions)
 """
} // end of function
var body: some View {
 ZStack {
   Color(red: 100000.0, green: 0.95, blue: 0.9)
     .ignoresSafeArea()
   VStack {
     Image("Foods")
       .resizable()
       .aspectRatio(contentMode: .fit)
      // .frame(width: 40,height:40)
       .offset(x: 0, y: -60)
     Text("Nutrition")
       .font(.custom("Baby Doll", size: 40))
       .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
       .offset(x: 0, y: -90)
     Text("Input your information")
       .font(.custom("Baby Doll", size: 22))
       .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
       .padding(.top, 10)
       .offset(x: 0, y: -100)
     VStack(spacing: 10) {
       TextField("Age", text: $age)
         .textFieldStyle(.roundedBorder)
         .keyboardType(.numberPad)
         .offset(x: 0, y: -90)
       TextField("Gender (M/F)", text: $gender)
         .textFieldStyle(.roundedBorder)
         .offset(x: 0, y: -90)
       TextField("Activity Level (1-10)", text: $active)
         .textFieldStyle(.roundedBorder)
         .keyboardType(.numberPad)
         .offset(x: 0, y: -90)
       TextField("Height (cm)", text: $height)
         .textFieldStyle(.roundedBorder)
         .keyboardType(.decimalPad)
         .offset(x: 0, y: -90)
       TextField("Weight (kg)", text: $weight)
         .textFieldStyle(.roundedBorder)
         .keyboardType(.decimalPad)
         .offset(x: 0, y: -90)
     }
      .padding()
     Button("Calculate") {
       results = calculate(
         age_: age,
         gender_: gender.uppercased(),
         active_: active
       )
     }
     .padding()
     .background(Color.orange)
     .foregroundColor(.white)
     .cornerRadius(10)
     .offset(y: -60)
     Text(results)
       .foregroundColor(.black)
       .font(.custom("Baby Doll", size: 16))
       .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
       .offset(x: 0, y: -30)
   }
 }
}
}
#Preview {
Nutrition()
}
