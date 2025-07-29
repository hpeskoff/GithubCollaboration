//
//  ContentView.swift
//  GithubCollaboration
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack
        {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            VStack {
                Text("ThriveCheck")
                    .font(.custom("Baby Doll", size: 40))
                    .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
                Image("logo_transparent")
                    .resizable()
                    .frame(width: 170, height: 170)
                    .padding(.leading, 0)
                Text("Your wellness is our happiness")
                    .font(.custom("Baby Doll", size: 22))
                    .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
                    .padding(.top, 10)
                NavigationStack {
                    
                    
                    NavigationLink(destination: Nutrition()) {
                        Image("Nutrition")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .frame(width: 900,height:200)
                    }
                    HStack {
                        NavigationLink(destination: Sleep()) {
                            Image("Sleep")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                                .frame(width: 200,height:200)
                        }
                        NavigationLink(destination: Social()) {
                            Image("Social")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                                .frame(width: 200,height:200)
                        }
                        
                        NavigationLink(destination: InitialEvaluation()) {
                            Image("Initial")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                                .frame(width: 200,height:200)
                        }
                    }
                    
                    
                    
                }
            }
            
            
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
