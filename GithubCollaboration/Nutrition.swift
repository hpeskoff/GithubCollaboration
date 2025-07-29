//
//  Nutrition.swift
//  GithubCollaboration
//
//  Created by Scholar on 7/29/25.
//


import Foundation
import SwiftUI
struct Nutrition: View {
@State private var age = ""
@State private var gender = ""
@State private var active = ""
@State private var textTitle = "input"
@State private var results = ""
    
    func calculate(age_: String, gender_ : String, active_: String) -> String {
        if (gender == "F") {
            if(age <= "8" && age > "2")
            {
                return results
            }
        }
        return results
    }
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            VStack {
                Text("Nutrition")
                    .font(.custom("Baby Doll", size: 40))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                
                Text("please input your info")
                    .font(.custom("Baby Doll", size: 22))
                    .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
                    .padding(.top, 10)
                //   Spacer()
                
                VStack {
                    //        Text(textTitle)
                    //  Text("")
                    TextField(" Age", text: $age)
                    TextField(" Gender (M/F)", text: $gender)
                    TextField(" Activity Level (1-10)", text: $active)
                    
                    Button("calculate") {
                        print(calculate(age_: age, gender_: gender, active_: active))
                    }
                    
                    
                }
            }
            
            
            
        }
    }
}
#Preview {
    Nutrition()
}

