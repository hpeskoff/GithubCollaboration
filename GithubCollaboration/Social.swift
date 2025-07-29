//
//  Social.swift
//  GithubCollaboration
//
//  Created by Scholar on 7/29/25.
//

import Foundation
import SwiftUI



struct Social: View {
    @State private var social_confidence = ""
    @State private var social_connection = ""
    @State private var social_extroversion = ""
    
    var body: some View {
        Text("This is the Social Wellbeing section.")
            .multilineTextAlignment(.center)
            .padding()
        ZStack{
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TextField("Rank from 1-10 how confident do you feel about your social skills.", text: $social_confidence)
                    .padding()
                
                TextField("How many chances do you get to connect with people?", text: $social_connection)
                    .padding()
                
                TextField("Would you describe yourself as a...", text: $social_extroversion)
                    .padding()
                
            }
            

            
        }
    }
}

#Preview {
    Social()
}
