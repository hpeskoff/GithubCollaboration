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
