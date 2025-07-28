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
            HStack {
                Text("To-Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
