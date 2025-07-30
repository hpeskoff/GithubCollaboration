////
////  Nutrition.swift
////  GithubCollaboration
////
////  Created by Scholar on 7/29/25.
////
//
//


import Foundation
import SwiftUI

struct Nutrition: View {
    @State private var age = ""
    @State private var gender = ""
    @State private var active = ""
    @State private var results = ""
    
    func calculate(age_: String, gender_ : String, active_: String) -> String {
        guard let ageInt = Int(age_), let activeInt = Int(active_), (gender_ == "F" || gender_ == "M") else {
            return "Please enter valid age, gender, and/or activity level."
        }

        var calories = 0
        var foodSuggestions = ""
        
        if gender_ == "F" {
            switch ageInt {
            case 3...8:
                calories = 1200 + (activeInt * 60)
                foodSuggestions = "Try: Yogurt, berries, cheese, peanut butter, carrots, whole grain cereal."
            case 9...13:
                calories = 1600 + (activeInt * 70)
                foodSuggestions = "Try: Grilled chicken, leafy greens, low-fat milk, oatmeal, eggs, oranges."
                
            case 14...18:
                calories = 1800 + (activeInt * 80)
                foodSuggestions = "Try: Salmon, almonds, Greek yogurt, brown rice, broccoli, bananas."
            case 19...50:
                calories = 1800 + (activeInt * 90)
                foodSuggestions = "Try: Avocados, quinoa, beans, spinach, tofu, cottage cheese."
            case 51...:
                calories = 1600 + (activeInt * 70)
                foodSuggestions = "Try: Soft cooked veggies, eggs, oatmeal, yogurt, sweet potatoes, fortified cereal."
            default:
                return "Age not in supported range."
        
            }
        } else if gender_ == "M" {
            switch ageInt {
            case 4...8:
                calories = 1400 + (activeInt * 70)
                foodSuggestions = "Try: Scrambled eggs, bananas, whole grain toast, milk, peas, turkey slices."
            case 9...13:
                calories = 1800 + (activeInt * 90)
                foodSuggestions = "Try: Chicken wraps, fruit smoothies, spinach, boiled eggs, nuts, pasta."
            case 14...18:
                calories = 2200 + (activeInt * 100)
                foodSuggestions = "Try: Steak, whole wheat bread, kale, beans, oranges, yogurt, tuna."
            case 19...50:
                calories = 2200 + (activeInt * 110)
                foodSuggestions =  "Try: Salmon, eggs, whole grains, legumes, sweet potatoes, spinach."
            case 51...:
                calories = 2000 + (activeInt * 90)
                foodSuggestions =  "Try: Steamed veggies, lentil soup, fish, oats, cooked apples, low-fat dairy."
            default:
                return "Age not in supported range."
                
            }
        }
        
        return "Estimated daily calories: \(calories) \n\nRecommended foods:\n\(foodSuggestions)"
    }
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            
            VStack {
                Text("Nutrition")
                    .font(.custom("Baby Doll", size: 40))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                
                Text("please input your information")
                    .font(.custom("Baby Doll", size: 22))
                    .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
                    .padding(.top, 10)
                
                VStack(spacing: 10) {
                    TextField("Age", text: $age)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    TextField("Gender (M/F)", text: $gender)
                        .textFieldStyle(.roundedBorder)
                    TextField("Activity Level (1-10)", text: $active)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                .padding()
                
                Button("Calculate") {
                    results = calculate(age_: age, gender_: gender.uppercased(), active_: active)
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Text(results)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    Nutrition()
}
