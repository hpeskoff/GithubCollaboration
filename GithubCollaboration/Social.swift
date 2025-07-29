//
//  Social.swift
//  GithubCollaboration
//
//  Created by Scholar on 7/29/25.
//

import Foundation
import SwiftUI

struct Social: View {
    var body: some View {
        Text("This is the Social Wellbeing section. Rank from 1-10 how confident do you feel about your social skills.")
            .multilineTextAlignment(.center)
            .padding()
        Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
        Text("How many chances do you get to connect with people?")
            .multilineTextAlignment(.center)
        Text("Would you describe yourself as a...")
            .multilineTextAlignment(.center)
        
    }
}

#Preview {
    Social()
}
