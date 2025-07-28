//
//  ContentView.swift
//  ReMakeToDoList
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("ThriveCheck")
                .font(.custom("Baby Doll", size: 24))
                .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            Image("logo")
                .resizable()
                .frame(width: 170, height: 170)
                .padding(.leading, 0)
        }
    }
}

#Preview {
    ContentView()
}
