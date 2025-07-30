//
//  Sleep.swift
//  GithubCollaboration
//
//  Created by Scholar on 7/29/25.
//
import Foundation
import SwiftUI
import SwiftData

struct SleepInfo: View {
    @State private var feelsWellRested: String? = nil
    @State private var gettingRecommendedSleep: String? = nil
    
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
    
    @State var gender = ""
    @State var age = 0
    
    var body: some View {
     
        //var recommended_sleep = sleep_tool(gender: gender, age: age)
        
        
        ZStack
        {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            VStack {
                Text("Sleep")
                    .font(.custom("Baby Doll", size: 40))
                    .font(.title)
                Text("Why is sleep important for you?")
                    .font(.custom("Baby Doll", size: 25))
                
                Text("")
                
                Text("Sleep is important for you and plays a huge role for both your mental and physical health. When you sleep, you go throught the process of repairing tissues, regulating hormones, and combine memories. Your overall experience of your day depends on how much sleep you get. When you sleep, the body undergoes essential restorative processes—repairing tissues, regulating hormones, and combine memories.")
                    .font(.custom("Baby Doll", size: 15))
                Text("")
                
                Text("For children and teens, sleep supports growth and development of the brain. For adults, sleep helps focus, decision-making, and emotional resilience. Sleep supports immune functioning and reduces the risk of chronic health conditions. This includes heart disease, diabetes and depression.")
                    .font(.custom("Baby Doll", size: 15))
                
                
                Text("")
                Text("Are you getting enough sleep?")
                    .font(.custom("Baby Doll", size: 25))
                Text("")
                Text("According to your quiz, you get \(calculateSleepRating()) sleep")
                
            }
        }
        
    }
}
#Preview {
    SleepInfo()
}
