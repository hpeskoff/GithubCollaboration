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
    var qualityOfSleep: String
//    @State private var gettingSleep = ""
//    @State private var rested = ""
    
    /*
    func calculateSleepRating() -> String {
        if gettingSleep != gettingRecommendedSleep
            && gettingSleep == "yes" && rested == "yes"  {
            qualityOfSleep = "Excellent"
                
        } else if gettingSleep == gettingRecommendedSleep
                    && gettingSleep == "no" && rested == "no" {
            qualityOfSleep = "Poor"
               
        } else if gettingSleep == gettingRecommendedSleep
                    && gettingSleep == "no" && rested == "yes" {
            qualityOfSleep = "Not Bad"
                
        }
            else if gettingSleep == gettingRecommendedSleep
                && gettingSleep == "yes" && rested == "no" {
                qualityOfSleep = "Not Bad"
                
            
            }
        
        return qualityOfSleep
    }
     */
    
    @State var gender = ""
    @State var age = 0
    
    var body: some View {
        
        ZStack
        {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
        ScrollView{
            VStack {
                Text("Sleep")
                    .font(.custom("Baby Doll", size: 60))
                    .font(.title)
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                Text("Why is sleep important for you?")
                    .font(.custom("Baby Doll", size: 25))
                    .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
                
                Text("")
                    .font(.custom("Baby Doll", size: 10))
                Text("Sleep is important for you and plays a huge role for both your mental and physical health. When you sleep, you go throught the process of repairing tissues, regulating hormones, and combine memories. Your overall experience of your day depends on how much sleep you get. When you sleep, the body undergoes essential restorative processes—repairing tissues, regulating hormones, and combine memories.")
                    .font(.custom("Baby Doll", size: 20))
                Text("")
                
                Text("For children and teens, sleep supports growth and development of the brain. For adults, sleep helps focus, decision-making, and emotional resilience. Sleep supports immune functioning and reduces the risk of chronic health conditions. This includes heart disease, diabetes and depression.")
                    .font(.custom("Baby Doll", size: 20))
                
                Image("InitialPic")
                    .resizable()
                   // .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 80)
                  
                
                Text("")
                Text("Are you getting enough sleep?")
                    .font(.custom("Baby Doll", size: 35))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                Text("")
                
                
                Text("Acoording to your quiz, you have \(qualityOfSleep) sleep. Now let's think about how you can improve.")
                    .font(.custom("Baby Doll", size: 20))
                    .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
                Text("")
                Text(" ")
        
                    
                
                
                Text("Poor Sleep:")
                    .font(.custom("Baby Doll", size: 30))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                Text("")
                Text("First, avoid using your phone or any screens at least an hour before bed because the blue light can mess with your sleep cycle. Try to keep your room dark and cool, since that can help you fall asleep faster. Also, try not to eat heavy meals or drink caffeine too late in the day. Creating a simple bedtime routine, like reading a book, can also help signal your body that it’s time to rest.")
                
                    .font(.custom("Baby Doll", size: 20))
                Image("Bad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 80)
                    .cornerRadius(40)
                
                Text(" ")
                Text("Not Bad Sleep:")
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                    .font(.custom("Baby Doll", size: 30))
                Text("")
                Text("Try to go to bed and wake up at the same time every day, even on weekends, to train your body clock. Make sure your pillow and mattress are comfortable and give you good support. Doing some light stretching or breathing exercises before bed can help you relax. Staying active during the day can also help you sleep more deeply at night.")
                    .font(.custom("Baby Doll", size: 20))
                Image("Okay")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 80)
                   // .cornerRadius(20)
                    .cornerRadius(90)
                
                Text(" ")
                Text("Excellent Sleep:")
                    .font(.custom("Baby Doll", size: 30))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                Text("Make your bedroom a calm and peaceful place, only for sleeping and relaxing. Keep your bedtime routine consistent and avoid any late-night stress or big tasks. Drinking enough water during the day and eating healthy meals can support good sleep too. Finally, listen to your body and rest when you need to—it makes a big difference.")
                    .font(.custom("Baby Doll", size: 20))
                Image("Good")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 80)
                    .cornerRadius(40)
                
                Text("")
                
                
                }
            }
        .padding()
        }
    }
}
#Preview {
    SleepInfo(qualityOfSleep: "Not enough data. Try Again")
}


