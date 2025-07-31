import Foundation
import SwiftUI



struct Social: View {
    @State private var social_confidence = ""
    @State private var social_connection = ""
    @State private var social_extroversion = ""
    

    // Computed property to determine the message based on social confidence
    var confidenceMessage: String {
        guard let confidence = Int(social_confidence), confidence >= 1 && confidence <= 10 else {
            return "Please enter a number between 1 and 10."
        }
        
        if confidence >= 7 {
            return "Great! You have high confidence in your social skills."
        } else if confidence >= 4 {
            return "You seem fairly confident in your social skills. Some recommendations to become even more confident in your social skills are attend events where you can meet new people like parties,and clubs. In addition you can also volunteering is also a great way to meet people with similar passions to yourself."
        } else {
            return "It seems you need to work on your social skills. Some recommendations of ways to improve are talking to someone familiar like a coworker or classmate,keep focused while the speaker is talking, and ask basic 'what','how','why'questions. "
        }
    }
    
    // Computed property to determine the message based on social connection
    var connectionMessage: String {
        guard let connection = Int(social_connection), connection > 0 else {
            return "Please enter a valid number."
        }
        
        if connection >= 5 {
            return "You have plenty of opportunities to connect with people."
        } else if connection >= 2 {
            return "You have some opportunities to connect with people."
        } else {
            return "You might want to find more ways to connect with people."
        }
    }
    
    // Computed property to determine the message based on social extroversion
    var extroversionMessage: String {
        if social_extroversion.lowercased().contains("extrovert") {
            return "You seem to be an extrovert!"
        } else if social_extroversion.lowercased().contains("introvert") {
            return "You seem to be an introvert!"
        } else {
            return "You have traits of introversion and extroversion."
        }
    }
    

    var body: some View {
        Text("This is the Social Wellbeing section.")
            .multilineTextAlignment(.center)
            .padding()

        ZStack {

            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TextField("Rank from 1-10 how confident do you feel about your social skills.", text: $social_confidence)
                    .padding()
                
                TextField("How many chances do you get to connect with people?", text: $social_connection)
                    .padding()
                
                TextField("Would you describe yourself as a...", text: $social_extroversion)
                    .padding()

                Text("hello")
                
            }
            

            

                
                // Display messages based on user input
                Text(confidenceMessage)
                    .foregroundColor(.blue)
                    .padding()
                
                Text(connectionMessage)
                    .foregroundColor(.green)
                    .padding()
                
                Text(extroversionMessage)
                    .foregroundColor(.purple)
                    .padding()
            }

        }
    }
}

#Preview {
    Social()
}
